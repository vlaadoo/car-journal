import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
class ShadColorScheme {
  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color border;
  final Color input;
  final Color ring;
  final Color selection;

  const ShadColorScheme({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.selection,
  });
  const ShadColorScheme.light({
    this.background = const Color(0xffffffff),
    this.foreground = const Color(0xff0a0a0a),
    this.card = const Color(0xffffffff),
    this.cardForeground = const Color(0xff0a0a0a),
    this.popover = const Color(0xffffffff),
    this.popoverForeground = const Color(0xff0a0a0a),
    this.primary = const Color(0xff171717),
    this.primaryForeground = const Color(0xfffafafa),
    this.secondary = const Color(0xfff5f5f5),
    this.secondaryForeground = const Color(0xff171717),
    this.muted = const Color(0xfff5f5f5),
    this.mutedForeground = const Color(0xff737373),
    this.accent = const Color(0xfff5f5f5),
    this.accentForeground = const Color(0xff171717),
    this.destructive = const Color(0xffef4444),
    this.destructiveForeground = const Color(0xfffafafa),
    this.border = const Color(0xffe5e5e5),
    this.input = const Color(0xffe5e5e5),
    this.ring = const Color(0xff0a0a0a),
    this.selection = const Color(0xFFB4D7FF),
  });

  const ShadColorScheme.dark({
    this.background = const Color(0xff0a0a0a),
    this.foreground = const Color(0xfffafafa),
    this.card = const Color(0xff0a0a0a),
    this.cardForeground = const Color(0xfffafafa),
    this.popover = const Color(0xff0a0a0a),
    this.popoverForeground = const Color(0xfffafafa),
    this.primary = const Color(0xfffafafa),
    this.primaryForeground = const Color(0xff171717),
    this.secondary = const Color(0xff262626),
    this.secondaryForeground = const Color(0xfffafafa),
    this.muted = const Color(0xff262626),
    this.mutedForeground = const Color(0xffa3a3a3),
    this.accent = const Color(0xff262626),
    this.accentForeground = const Color(0xfffafafa),
    this.destructive = const Color(0xff7f1d1d),
    this.destructiveForeground = const Color(0xfffafafa),
    this.border = const Color(0xff262626),
    this.input = const Color(0xff262626),
    this.ring = const Color(0xffd4d4d4),
    this.selection = const Color(0xFF355172),
  });
}
