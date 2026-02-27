import 'package:flutter/material.dart';
import '../models/environment_info.dart';
import '../screens/env_detail_screen.dart';

class EnvCard extends StatelessWidget {
  final EnvironmentInfo info;

  const EnvCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final info = this.info;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => EnvDetailScreen(info: info)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── 主行：图标 + 名称 + 状态 ──
              Row(
                children: [
                  _buildIcon(info, colorScheme),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                info.name,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: info.status == ScanStatus.notFound
                                      ? colorScheme.onSurface.withValues(
                                          alpha: 0.45,
                                        )
                                      : null,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            _buildStatusBadge(info, theme),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          info.hint,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(
                              alpha: 0.55,
                            ),
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // 箭头指示可点击进入详情
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 18,
                    color: colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(EnvironmentInfo info, ColorScheme cs) {
    Color iconBg;
    Color iconFg;

    switch (info.status) {
      case ScanStatus.found:
        iconBg = info.categoryColor.withValues(alpha: 0.12);
        iconFg = info.categoryColor;
      case ScanStatus.notFound:
        iconBg = cs.onSurface.withValues(alpha: 0.06);
        iconFg = cs.onSurface.withValues(alpha: 0.3);
      case ScanStatus.scanning:
      case ScanStatus.pending:
        iconBg = cs.onSurface.withValues(alpha: 0.06);
        iconFg = cs.onSurface.withValues(alpha: 0.4);
      case ScanStatus.error:
        iconBg = Colors.orange.withValues(alpha: 0.12);
        iconFg = Colors.orange;
    }

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: iconBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: info.status == ScanStatus.scanning
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: cs.primary.withValues(alpha: 0.5),
              ),
            )
          : Icon(info.icon, size: 18, color: iconFg),
    );
  }

  Widget _buildStatusBadge(EnvironmentInfo info, ThemeData theme) {
    switch (info.status) {
      case ScanStatus.found:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            info.version != null ? 'v${info.version}' : '已安装',
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF16A34A),
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case ScanStatus.notFound:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '未安装',
            style: TextStyle(
              fontSize: 11,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
            ),
          ),
        );
      case ScanStatus.scanning:
        return Text(
          '检测中...',
          style: TextStyle(
            fontSize: 11,
            color: theme.colorScheme.primary.withValues(alpha: 0.7),
          ),
        );
      case ScanStatus.pending:
        return Text(
          '等待中',
          style: TextStyle(
            fontSize: 11,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
          ),
        );
      case ScanStatus.error:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            '检测异常',
            style: TextStyle(fontSize: 11, color: Colors.orange),
          ),
        );
    }
  }
}
