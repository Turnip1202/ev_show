import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/environment_info.dart';
import '../providers/scan_provider.dart';
import '../widgets/env_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  final Set<EnvironmentCategory> _selectedCategories = {};
  // 记录哪些分类处于折叠状态（默认全部展开）
  final Set<EnvironmentCategory> _collapsedCategories = {};
  bool _showOnlyInstalled = false;
  final TextEditingController _searchCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    // 启动时自动扫描
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ScanProvider>().startScan();
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ScanProvider>();
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surfaceContainerLowest,
      appBar: _buildAppBar(context, provider, theme, cs),
      body: Column(
        children: [
          // 扫描进度条
          if (provider.isScanning) _buildProgressBar(provider, cs),
          // 环境变量提示横幅
          if (provider.phase == ScanPhase.done)
            _buildInfoBanner(context, provider, theme),
          // 搜索 + 筛选栏
          _buildFilterBar(context, provider, theme, cs),
          // 主内容
          Expanded(
            child: provider.phase == ScanPhase.idle
                ? _buildIdleView(context, theme, cs)
                : _buildContent(context, provider, theme, cs),
          ),
        ],
      ),
    );
  }

  // ────────────────────────────────────────────
  // AppBar
  // ────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    ScanProvider provider,
    ThemeData theme,
    ColorScheme cs,
  ) {
    return AppBar(
      backgroundColor: cs.surface,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.monitor_heart_outlined,
              size: 22,
              color: cs.primary,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '环境管家',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'ev_show · Windows',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        // 统计信息
        if (provider.phase == ScanPhase.done)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: _StatChip(
              found: provider.foundCount,
              total: provider.totalCount,
            ),
          ),
        // 刷新按钮
        Tooltip(
          message: '重新扫描环境\n（如果刚安装了软件，请先重启本程序）',
          child: IconButton(
            onPressed: provider.isScanning ? null : () => provider.startScan(),
            icon: provider.isScanning
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: cs.primary,
                    ),
                  )
                : const Icon(Icons.refresh_rounded),
            tooltip: '',
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  // ────────────────────────────────────────────
  // 进度条
  // ────────────────────────────────────────────
  Widget _buildProgressBar(ScanProvider provider, ColorScheme cs) {
    return LinearProgressIndicator(
      value: provider.progress,
      backgroundColor: cs.surfaceContainerHighest,
      minHeight: 3,
    );
  }

  // ────────────────────────────────────────────
  // 提示横幅
  // ────────────────────────────────────────────
  Widget _buildInfoBanner(
    BuildContext context,
    ScanProvider provider,
    ThemeData theme,
  ) {
    final lastTime = provider.lastScanTime;
    final timeStr = lastTime != null
        ? DateFormat('HH:mm:ss').format(lastTime)
        : '';

    return Material(
      color: const Color(0xFFFFF7ED),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              size: 16,
              color: Color(0xFFD97706),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '扫描完成于 $timeStr ·  如果刚安装了新软件但看不到，请重启本程序后再次扫描',
                style: const TextStyle(fontSize: 12, color: Color(0xFF92400E)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ────────────────────────────────────────────
  // 搜索 + 筛选栏
  // ────────────────────────────────────────────
  Widget _buildFilterBar(
    BuildContext context,
    ScanProvider provider,
    ThemeData theme,
    ColorScheme cs,
  ) {
    return Container(
      color: cs.surface,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 搜索框
          TextField(
            controller: _searchCtrl,
            onChanged: (v) => setState(() => _searchQuery = v.toLowerCase()),
            decoration: InputDecoration(
              hintText: '搜索工具名称、描述...',
              hintStyle: TextStyle(
                fontSize: 13,
                color: cs.onSurface.withValues(alpha: 0.4),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 18,
                color: cs.onSurface.withValues(alpha: 0.4),
              ),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 16),
                      onPressed: () {
                        _searchCtrl.clear();
                        setState(() => _searchQuery = '');
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: cs.outline.withValues(alpha: 0.4),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: cs.outline.withValues(alpha: 0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: cs.primary, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // 快速筛选
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _FilterChip(
                  label: '仅显示已安装',
                  selected: _showOnlyInstalled,
                  icon: Icons.check_circle_outline,
                  activeColor: Colors.green,
                  onTap: () =>
                      setState(() => _showOnlyInstalled = !_showOnlyInstalled),
                ),
                const SizedBox(width: 6),
                ...EnvironmentCategory.values.map((cat) {
                  final meta = kCategoryMeta[cat]!;
                  final isSelected = _selectedCategories.contains(cat);
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _FilterChip(
                      label: meta.label,
                      selected: isSelected,
                      icon: meta.icon,
                      activeColor: meta.color,
                      onTap: () => setState(() {
                        if (isSelected) {
                          _selectedCategories.remove(cat);
                        } else {
                          _selectedCategories.add(cat);
                        }
                      }),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ────────────────────────────────────────────
  // 初始空状态
  // ────────────────────────────────────────────
  Widget _buildIdleView(BuildContext context, ThemeData theme, ColorScheme cs) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.monitor_heart_outlined,
            size: 64,
            color: cs.primary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            '准备检测您的开发环境',
            style: theme.textTheme.titleMedium?.copyWith(
              color: cs.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => context.read<ScanProvider>().startScan(),
            icon: const Icon(Icons.search_rounded),
            label: const Text('开始扫描'),
          ),
        ],
      ),
    );
  }

  // ────────────────────────────────────────────
  // 主内容（按分类分组）
  // ────────────────────────────────────────────
  Widget _buildContent(
    BuildContext context,
    ScanProvider provider,
    ThemeData theme,
    ColorScheme cs,
  ) {
    final grouped = provider.groupedItems;

    // 过滤
    final filteredGroups = <EnvironmentCategory, List<EnvironmentInfo>>{};
    grouped.forEach((cat, items) {
      // 分类过滤
      if (_selectedCategories.isNotEmpty &&
          !_selectedCategories.contains(cat)) {
        return;
      }
      final filtered = items.where((item) {
        // 已安装过滤
        if (_showOnlyInstalled && item.status != ScanStatus.found) {
          return false;
        }
        // 搜索过滤
        if (_searchQuery.isNotEmpty) {
          final q = _searchQuery;
          return item.name.toLowerCase().contains(q) ||
              item.description.toLowerCase().contains(q) ||
              item.hint.toLowerCase().contains(q);
        }
        return true;
      }).toList();

      if (filtered.isNotEmpty) {
        filteredGroups[cat] = filtered;
      }
    });

    if (filteredGroups.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 48,
              color: cs.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 12),
            Text(
              '没有找到匹配的环境',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollCtrl,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      itemCount: filteredGroups.length,
      itemBuilder: (context, idx) {
        final cat = filteredGroups.keys.elementAt(idx);
        final items = filteredGroups[cat]!;
        return _CategorySection(
          key: ValueKey(cat),
          category: cat,
          items: items,
          isCollapsed: _collapsedCategories.contains(cat),
          onToggle: () => setState(() {
            if (_collapsedCategories.contains(cat)) {
              _collapsedCategories.remove(cat);
            } else {
              _collapsedCategories.add(cat);
            }
          }),
        );
      },
    );
  }
}

// ══════════════════════════════════════════════
// 分类区块（支持折叠）
// ══════════════════════════════════════════════
class _CategorySection extends StatelessWidget {
  final EnvironmentCategory category;
  final List<EnvironmentInfo> items;
  final bool isCollapsed;
  final VoidCallback onToggle;

  const _CategorySection({
    super.key,
    required this.category,
    required this.items,
    required this.isCollapsed,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final meta = kCategoryMeta[category]!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final foundCount = items.where((i) => i.status == ScanStatus.found).length;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 可点击的分类标题栏 ──
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  // 分类标签
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: meta.color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(meta.icon, size: 14, color: meta.color),
                        const SizedBox(width: 5),
                        Text(
                          meta.label,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: meta.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 已安装统计
                  Text(
                    '$foundCount / ${items.length} 已安装',
                    style: TextStyle(
                      fontSize: 12,
                      color: cs.onSurface.withValues(alpha: 0.45),
                    ),
                  ),
                  const Spacer(),
                  // 折叠/展开图标
                  AnimatedRotation(
                    turns: isCollapsed ? -0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: cs.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
          // ── 卡片网格（带动画折叠）──
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 220),
            crossFadeState: isCollapsed
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns;
                  if (width > 900) {
                    columns = 4;
                  } else if (width > 600) {
                    columns = 3;
                  } else if (width > 400) {
                    columns = 2;
                  } else {
                    columns = 1;
                  }
                  return _buildGrid(items, columns);
                },
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
          // 分隔线
          Divider(height: 1, color: cs.outline.withValues(alpha: 0.1)),
        ],
      ),
    );
  }

  Widget _buildGrid(List<EnvironmentInfo> items, int columns) {
    final rows = <Widget>[];
    for (var i = 0; i < items.length; i += columns) {
      final rowItems = items.sublist(
        i,
        i + columns > items.length ? items.length : i + columns,
      );
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...rowItems.map(
              (item) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, bottom: 8),
                  child: EnvCard(info: item),
                ),
              ),
            ),
            ...List.generate(
              columns - rowItems.length,
              (_) => const Expanded(child: SizedBox()),
            ),
          ],
        ),
      );
    }
    return Column(children: rows);
  }
}

// ══════════════════════════════════════════════
// 统计芯片
// ══════════════════════════════════════════════
class _StatChip extends StatelessWidget {
  final int found;
  final int total;

  const _StatChip({required this.found, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 14,
            color: Color(0xFF16A34A),
          ),
          const SizedBox(width: 4),
          Text(
            '$found / $total 已安装',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF16A34A),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════
// 筛选芯片
// ══════════════════════════════════════════════
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final IconData icon;
  final Color activeColor;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.icon,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selected
              ? activeColor.withValues(alpha: 0.12)
              : cs.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? activeColor.withValues(alpha: 0.5)
                : cs.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 13,
              color: selected
                  ? activeColor
                  : cs.onSurface.withValues(alpha: 0.5),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: selected
                    ? activeColor
                    : cs.onSurface.withValues(alpha: 0.6),
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
