import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izi_shop/client.dart';
import 'custom_route.dart';
import 'search_page.dart';
import 'transition_route_observer.dart';
import 'widgets/fade_in.dart';
// ignore: unused_import
import 'constants.dart';

// temporary
import 'cart.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/auth')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  Future<bool> _goToGlobalSearch(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/search')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  Future<bool> _gotoCart(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/cart')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute?>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  late Animation<double> _headerScaleAnimation;
  AnimationController? _loadingController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController!,
      curve: headerAniInterval,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>?);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController!.forward();

  final TextEditingController _filter = new TextEditingController();

  Icon _cartIcon = new Icon(Icons.shopping_bag);
  Widget _appBarTitle =
      new Text('Eazi Shop', style: TextStyle(color: Colors.deepPurple[400]));

  AppBar _buildAppBar(ThemeData theme) {
    final cart = new IconButton(
        color: Colors.deepPurple,
        icon: _cartIcon,
        onPressed: () => Navigator.of(context)
            .pushReplacement(FadePageRoute(builder: (context) => ClientView()
                // Cart(
                //       count: 3,
                //       price: 2,
                //       Name: "widget.Name",
                //       Description: "widget.Description",
                //     )),
                )));
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.signOutAlt),
      color: Colors.deepPurple,
      onPressed: () => _goToLogin(context),
    );

    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: Row(
        children: [
          cart,
        ],
      ),
      leadingWidth: 100,
      actions: <Widget>[
        FadeIn(
          controller: _loadingController,
          offset: .3,
          curve: headerAniInterval,
          fadeDirection: FadeDirection.endToStart,
          child: signOutBtn,
        ),
      ],
      backgroundColor: theme.primaryColor.withOpacity(.1),
      elevation: 1,
      // toolbarTextStyle: TextStle(),
      // textTheme: theme.accentTextTheme,
      // iconTheme: theme.accentIconTheme,
    );
  }

  Widget _buildHeader(ThemeData theme) {
    final primaryColor = Colors.deepPurple;
    final accentColor = Colors.deepOrange;
    final linearGradient = LinearGradient(colors: [
      primaryColor.shade800,
      primaryColor.shade200,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 418.0, 78.0));

    return ScaleTransition(
      scale: _headerScaleAnimation,
      child: FadeIn(
        controller: _loadingController,
        curve: headerAniInterval,
        fadeDirection: FadeDirection.bottomToTop,
        offset: .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome!',
                  style: theme.textTheme.headline3!.copyWith(
                    foreground: Paint()..shader = linearGradient,
                  ),
                ),
              ],
            ),
            Text('Select a Shop to start shopping',
                style: theme.textTheme.subtitle1),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardGrid() {
    const step = 0.04;
    const aniInterval = 0.75;

    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              InkWell(
                splashColor: Colors.deepPurple,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/pnp.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () =>
                    Navigator.of(context).pushReplacement(FadePageRoute(
                  builder: (context) => const GlobalSearchScreen(),
                )),
              ),
              InkWell(
                splashColor: Colors.deepPurple,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/bm.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () =>
                    Navigator.of(context).pushReplacement(FadePageRoute(
                  builder: (context) => const GlobalSearchScreen(),
                )),
              ),
              InkWell(
                splashColor: Colors.deepPurple,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/spar.png',
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () =>
                    Navigator.of(context).pushReplacement(FadePageRoute(
                  builder: (context) => const GlobalSearchScreen(),
                )),
              ),
              InkWell(
                splashColor: Colors.deepPurple,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/ok.png',
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () =>
                    Navigator.of(context).pushReplacement(FadePageRoute(
                  builder: (context) => const GlobalSearchScreen(),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDebugButtons() {
    const textStyle = TextStyle(fontSize: 12, color: Colors.white);

    return Positioned(
      bottom: 0,
      right: 0,
      child: Row(
        children: <Widget>[
          MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.red,
            onPressed: () => _loadingController!.value == 0
                ? _loadingController!.forward()
                : _loadingController!.reverse(),
            child: const Text('loading', style: textStyle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => _goToLogin(context),
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(theme),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.primaryColor.withOpacity(.1),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Expanded(
                      flex: 2,
                      child: _buildHeader(theme),
                    ),
                    Expanded(
                      flex: 8,
                      child: ShaderMask(
                        // blendMode: BlendMode.srcOver,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            tileMode: TileMode.clamp,
                            colors: <Color>[
                              Colors.grey.shade50,
                              Colors.grey.shade100,
                              Colors.grey.shade200,
                              Colors.red.shade500,
                              // Colors.green.shade50,
                              // Colors.redAccent.shade100,
                              // Colors.red,
                              // Colors.yellow,
                            ],
                          ).createShader(bounds);
                        },
                        child: _buildDashboardGrid(),
                      ),
                    ),
                  ],
                ),
                // if (!kReleaseMode) _buildDebugButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
