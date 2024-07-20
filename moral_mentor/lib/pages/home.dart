import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moral_mentor/pages/scenarios_page.dart';
import 'package:moral_mentor/widgets/appbar.dart';
import 'package:moral_mentor/widgets/appdrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TypingTextSlider extends StatefulWidget {
  final List<String> texts;
  final TextStyle textStyle;
  final Duration typingDuration;
  final Duration pauseDuration;

  const TypingTextSlider({
    Key? key,
    required this.texts,
    required this.textStyle,
    this.typingDuration = const Duration(milliseconds: 100),
    this.pauseDuration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  _TypingTextSliderState createState() => _TypingTextSliderState();
}

class _TypingTextSliderState extends State<TypingTextSlider> {
  late int _currentTextIndex;
  late String _currentText;

  @override
  void initState() {
    super.initState();
    _currentTextIndex = 0;
    _currentText = '';
    _startTyping();
  }

  void _startTyping() async {
    while (mounted) {
      await _typeText(widget.texts[_currentTextIndex]);
      await Future.delayed(widget.pauseDuration);
      await _eraseText();
      if (mounted) {
        setState(() {
          _currentTextIndex = (_currentTextIndex + 1) % widget.texts.length;
        });
      }
    }
  }

  Future<void> _typeText(String text) async {
    for (int i = 0; i <= text.length; i++) {
      if (mounted) {
        setState(() => _currentText = text.substring(0, i));
        await Future.delayed(widget.typingDuration);
      }
    }
  }

  Future<void> _eraseText() async {
    for (int i = _currentText.length; i >= 0; i--) {
      if (mounted) {
        setState(() => _currentText = _currentText.substring(0, i));
        await Future.delayed(widget.typingDuration);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_currentText, style: widget.textStyle),
        _buildCursor(),
      ],
    );
  }

  Widget _buildCursor() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: widget.textStyle.fontSize,
      width: 2,
      color: Colors.black,
      curve: Curves.easeInOut,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResponsiveAppBar(
        userName: 'John Doe',
        profilePicUrl: 'https://example.com/profile_pic.png',
      ),
      drawer: const AppDrawer(
        userName: 'John Doe',
        profilePicUrl: 'https://example.com/profile_pic.png',
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: constraints.maxWidth,
              color: Colors.white,
              child: Column(
                children: [
                  _buildWelcomeSection(constraints),
                  const SizedBox(height: 40),
                  _buildQuoteCarousel(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWelcomeSection(BoxConstraints constraints) {
    final isWideScreen = constraints.maxWidth > 800;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: isWideScreen
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWelcomeText(constraints.maxWidth),
            const SizedBox(width: 40),
            _buildHeroImage(),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWelcomeText(constraints.maxWidth),
            const SizedBox(height: 40),
            _buildHeroImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText(double maxWidth) {
    final isWideScreen = maxWidth > 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome To MoralMentor',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isWideScreen ? 40 : 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Your AI-Powered Technology in Ethics and Morals',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isWideScreen ? 22 : 18,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Text(
                'Let\'s enhance your learning with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isWideScreen ? 24 : 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TypingTextSlider(
                texts: const [
                  'Interactive Ethical Dilemmas',
                  'Immersive Ethical Scenarios',
                  'Thought-provoking Dilemmas',
                ],
                textStyle: TextStyle(
                  fontSize: isWideScreen ? 20 : 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        _buildGetStartedButton(),
      ],
    );
  }

  Widget _buildHeroImage() {
    return SizedBox(
      width: 400,
      height: 400,
      child: Image.asset(
        'assets/images/hero_image.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return GetStartedButton(
      onPressed: (context) {
        context.go('/scenarios_page');
      },
    );
  }

  Widget _buildQuoteCarousel() {
    final quotes = [
      "The greatest glory in living lies not in never falling, but in rising every time we fall. -Nelson Mandela",
      "The way to get started is to quit talking and begin doing. -Walt Disney",
      "Your time is limited, don't waste it living someone else's life. -Steve Jobs",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: quotes.map((quote) => _buildQuoteItem(quote)).toList(),
      ),
    );
  }

  Widget _buildQuoteItem(String quote) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              quote,
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

class GetStartedButton extends StatefulWidget {
  final Function(BuildContext) onPressed;

  const GetStartedButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _GetStartedButtonState createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => widget.onPressed(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: isHovered ? Colors.blue[700] : Colors.blue,
            borderRadius: BorderRadius.circular(30),
            boxShadow: isHovered
                ? [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
                : [],
          ),
          child: const Text(
            'Get Started',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
