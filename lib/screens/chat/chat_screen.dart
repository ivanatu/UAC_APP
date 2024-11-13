import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '/exports/exports.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Contact information
  final Map<String, String> contactInfo = {
    'Website': 'https://www.uac.go.ug/',
    'Email': 'uac@uac.go.ug',
    'Phone': '+256 414 288065',
    'Address': 'Plot 1-3 Salim Bay Rd, Ntinda, Kampala, Uganda',
    'Hours': 'Mon - Fri 9:00 am - 5:00 pm',
  };

  // Social media links
  final List<SocialMediaItem> socialMediaItems = [
    SocialMediaItem(
      icon: 'assets/svgs/facebook.svg',
      color: Colors.blue.shade900,
      url: 'https://www.facebook.com/UgandaAidsCommission',
    ),
    SocialMediaItem(
      icon: 'assets/svgs/whatsapp.svg',
      color: Colors.green,
      url: 'https://wa.me/256770522051',
    ),
    SocialMediaItem(
      icon: 'assets/svgs/twitter.svg',
      color: Colors.blue,
      url: 'https://x.com/aidscommission',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'Get in Touch',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
    );
  }

  Widget _buildContactCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
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
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
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
        fontFamily: 'Montserrat',
        color: isClickable ? Theme.of(context).primaryColor : null,
        decoration: isClickable ? TextDecoration.underline : null,
      ),
    );
  }

  Widget _buildFeedbackCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Feedback',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'We would love to hear from you. Please send us your feedback, suggestions, or any issues you may have encountered while using our app.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: 'Montserrat',
                  ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                launchUrl(Uri.parse('mailto:uac@uac.go.ug?subject=Feedback'));
              },
              icon: const Icon(Icons.mail_outline),
              label: const Text('Send Feedback'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
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
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Montserrat',
                  color: Colors.grey,
                ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialMediaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Us',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
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
        width: 32,
        height: 32,
      ),
      onPressed: () => launchUrl(Uri.parse(item.url)),
    );
  }

  Widget _buildPhoneButton() {
    return IconButton(
      icon: Icon(
        Icons.phone,
        color: Colors.teal.shade600,
        size: 32,
      ),
      onPressed: () => launchUrl(Uri.parse('tel:+256414288065')),
    );
  }

  Widget _buildShareButton() {
    return IconButton(
      icon: Icon(
        Icons.share,
        color: Colors.orange.shade600,
        size: 32,
      ),
      onPressed: () {
        Share.share(
          'Hey, I found this amazing app that helps me stay updated with the latest news and stats on HIV/AIDS. You should check it out too. https://www.uac.go.ug/',
          subject: 'Check out this great app!',
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
