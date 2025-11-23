import 'package:url_launcher/url_launcher.dart';
import '/exports/exports.dart';
import '/controllers/get_in_touch_controller.dart';

class GetInTouchScreen extends StatefulWidget {
  const GetInTouchScreen({super.key});

  @override
  State<GetInTouchScreen> createState() => _GetInTouchScreenState();
}

class _GetInTouchScreenState extends State<GetInTouchScreen> {
  late GetInTouchController _controller;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    _controller = GetInTouchController();
    _fetchData();
    // });
  }

  Future<void> _fetchData() async {
    await _controller.fetchGetInTouch();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          if (_controller.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_controller.getInTouchModel == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load contact information',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _fetchData,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _fetchData,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 24),
                    _buildContactCard(context),
                    const SizedBox(height: 16),
                    _buildFeedbackCard(context),
                    const SizedBox(height: 24),
                    _buildDivider(context),
                    const SizedBox(height: 24),
                    _buildSocialMediaSection(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'Get in Touch',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildContactCard(BuildContext context) {
    final data = _controller.getInTouchModel!.attributes;

    final contactInfo = {
      'Website': data.website,
      'Email': data.email,
      'Phone': data.telephone,
      'Address': data.address,
      'Hours': data.hours,
    };

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contactInfo.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      '${entry.key}:',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: _buildClickableText(context, entry.key, entry.value),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildClickableText(BuildContext context, String type, String value) {
    final bool isClickable =
        type == 'Website' || type == 'Email' || type == 'Phone';

    return Text(
      value,
      style: TextStyle(
        color: isClickable ? Theme.of(context).primaryColor : null,
        decoration: isClickable ? TextDecoration.underline : null,
      ),
    );
  }

  Widget _buildFeedbackCard(BuildContext context) {
    final email = _controller.getInTouchModel!.attributes.email;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Feedback',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'We would love to hear from you. Please send us your feedback, suggestions, or any issues you may have encountered while using our app.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                launchUrl(Uri.parse('mailto:$email?subject=Feedback'));
              },
              icon: const Icon(Icons.mail_outline),
              label: const Text('Send Feedback'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialMediaSection(BuildContext context) {
    final data = _controller.getInTouchModel!.attributes;

    final socialMediaItems = [
      SocialMediaItem(
        icon: 'assets/svgs/facebook.svg',
        color: Colors.blue.shade900,
        url: "https://facebook.com/${data.facebook}",
      ),
      SocialMediaItem(
        icon: 'assets/svgs/whatsapp.svg',
        color: Colors.green,
        url: "https://wa.me/${data.whatsapp}",
      ),
      SocialMediaItem(
        icon: 'assets/svgs/twitter.svg',
        color: Colors.black,
        url: "https://x.com/${data.twitter}",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Us',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...socialMediaItems.map((item) => _buildSocialMediaButton(item)),
            _buildPhoneButton(),
            _buildShareButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialMediaButton(SocialMediaItem item) {
    return IconButton(
      icon: SvgPicture.asset(
        item.icon,
        color: item.color,
        width: 25,
        height: 25,
        fit: BoxFit.cover,
      ),
      onPressed: () => launchUrl(Uri.parse(item.url)),
    );
  }

  Widget _buildPhoneButton() {
    final phone = _controller.getInTouchModel!.attributes.telephone;
    final phoneUri = phone.replaceAll(' ', '').replaceAll('-', '');

    return IconButton(
      icon: Icon(Icons.phone, color: Colors.teal.shade600, size: 25),
      onPressed: () => launchUrl(Uri.parse('tel:$phoneUri')),
    );
  }

  Widget _buildShareButton() {
    final website = _controller.getInTouchModel!.attributes.website;

    return IconButton(
      icon: Icon(Icons.share, color: Colors.orange.shade600, size: 25),
      onPressed: () {
        SharePlus.instance.share(
          ShareParams(
            text:
                'Hey, I found this amazing app that helps me stay updated with the latest news and stats on HIV/AIDS. You should check it out too. $website',
            subject: 'Check out this great app!',
          ),
        );
      },
    );
  }
}

class SocialMediaItem {
  final String icon;
  final Color color;
  final String url;

  const SocialMediaItem({
    required this.icon,
    required this.color,
    required this.url,
  });
}
