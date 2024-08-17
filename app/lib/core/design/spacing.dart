import 'package:flutter/widgets.dart';

class Spacers {
  static const em = 4.0;

  static const xxs = 1 * em;
  static const xs = 2 * em;
  static const s = 3 * em;
  static const m = 4 * em;
  static const l = 6 * em;
  static const xl = 8 * em;
  static const x2l = 12 * em;
  static const x3l = 16 * em;
  static const x4l = 24 * em;
  static const x5l = 32 * em;
  static const x6l = 64 * em;
  static const x7l = 96 * em;
  static const x8l = 128 * em;
}

/// A horizontal space of given width
class HSpace extends StatelessWidget {
  const HSpace(this.width, {super.key});

  const HSpace.xxs({Key? key}) : this(Spacers.xxs, key: key);
  const HSpace.xs({Key? key}) : this(Spacers.xs, key: key);
  const HSpace.s({Key? key}) : this(Spacers.s, key: key);
  const HSpace.m({Key? key}) : this(Spacers.m, key: key);
  const HSpace.l({Key? key}) : this(Spacers.l, key: key);
  const HSpace.xl({Key? key}) : this(Spacers.xl, key: key);
  const HSpace.x2l({Key? key}) : this(Spacers.x2l, key: key);
  const HSpace.x3l({Key? key}) : this(Spacers.x3l, key: key);
  const HSpace.x4l({Key? key}) : this(Spacers.x4l, key: key);
  const HSpace.x5l({Key? key}) : this(Spacers.x5l, key: key);
  const HSpace.x6l({Key? key}) : this(Spacers.x6l, key: key);
  const HSpace.expand({Key? key}) : this(double.infinity, key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

/// A vertical space of given height
class VSpace extends StatelessWidget {
  const VSpace(this.height, {super.key});

  const VSpace.xxs({Key? key}) : this(Spacers.xxs, key: key);
  const VSpace.xs({Key? key}) : this(Spacers.xs, key: key);
  const VSpace.s({Key? key}) : this(Spacers.s, key: key);
  const VSpace.m({Key? key}) : this(Spacers.m, key: key);
  const VSpace.l({Key? key}) : this(Spacers.l, key: key);
  const VSpace.xl({Key? key}) : this(Spacers.xl, key: key);
  const VSpace.x2l({Key? key}) : this(Spacers.x2l, key: key);
  const VSpace.x3l({Key? key}) : this(Spacers.x3l, key: key);
  const VSpace.x4l({Key? key}) : this(Spacers.x4l, key: key);
  const VSpace.x5l({Key? key}) : this(Spacers.x5l, key: key);
  const VSpace.x6l({Key? key}) : this(Spacers.x6l, key: key);
  const VSpace.expand({Key? key}) : this(double.infinity, key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

/// A horizontal space of given width
class SliverHSpace extends StatelessWidget {
  const SliverHSpace(this.width, {super.key});

  const SliverHSpace.xxs({Key? key}) : this(Spacers.xxs, key: key);
  const SliverHSpace.xs({Key? key}) : this(Spacers.xs, key: key);
  const SliverHSpace.s({Key? key}) : this(Spacers.s, key: key);
  const SliverHSpace.m({Key? key}) : this(Spacers.m, key: key);
  const SliverHSpace.l({Key? key}) : this(Spacers.l, key: key);
  const SliverHSpace.xl({Key? key}) : this(Spacers.xl, key: key);
  const SliverHSpace.x2l({Key? key}) : this(Spacers.x2l, key: key);
  const SliverHSpace.x3l({Key? key}) : this(Spacers.x3l, key: key);
  const SliverHSpace.x4l({Key? key}) : this(Spacers.x4l, key: key);
  const SliverHSpace.x5l({Key? key}) : this(Spacers.x5l, key: key);
  const SliverHSpace.x6l({Key? key}) : this(Spacers.x6l, key: key);
  const SliverHSpace.expand({Key? key}) : this(double.infinity, key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: HSpace(width),
    );
  }
}

/// A vertical space of given height
class SliverVSpace extends StatelessWidget {
  const SliverVSpace(this.height, {super.key});

  const SliverVSpace.xxs({Key? key}) : this(Spacers.xxs, key: key);
  const SliverVSpace.xs({Key? key}) : this(Spacers.xs, key: key);
  const SliverVSpace.s({Key? key}) : this(Spacers.s, key: key);
  const SliverVSpace.m({Key? key}) : this(Spacers.m, key: key);
  const SliverVSpace.l({Key? key}) : this(Spacers.l, key: key);
  const SliverVSpace.xl({Key? key}) : this(Spacers.xl, key: key);
  const SliverVSpace.x2l({Key? key}) : this(Spacers.x2l, key: key);
  const SliverVSpace.x3l({Key? key}) : this(Spacers.x3l, key: key);
  const SliverVSpace.x4l({Key? key}) : this(Spacers.x4l, key: key);
  const SliverVSpace.x5l({Key? key}) : this(Spacers.x5l, key: key);
  const SliverVSpace.x6l({Key? key}) : this(Spacers.x6l, key: key);
  const SliverVSpace.expand({Key? key}) : this(double.infinity, key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: VSpace(height),
    );
  }
}

double screenAspectRatio(BuildContext context) =>
    screenWidth(context) / screenHeight(context);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(
  BuildContext context, {
  double dividedBy = 1,
  double offsetBy = 0,
}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(
  BuildContext context, {
  double dividedBy = 1,
  double offsetBy = 0,
}) =>
    (screenWidth(context) - offsetBy) / dividedBy;
