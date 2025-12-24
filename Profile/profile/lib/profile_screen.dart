import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // A small helper used for social buttons: shows the URL in a SnackBar.
  void _showLink(BuildContext context, String url) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Open link: $url')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFF6F9FF),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Card(
                color: Colors.white,
                elevation: 18,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 900;
                      // Make the whole card scrollable for many sections
                      return SingleChildScrollView(
                        child: isNarrow
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: _buildChildrenWithDetails(
                                  context,
                                  isNarrow,
                                ),
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _buildChildrenWithDetails(
                                  context,
                                  isNarrow,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildrenWithDetails(BuildContext context, bool isNarrow) {
    // Build the left column (avatar + social)
    final left = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 76,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                'https://i.ibb.co/d460fnqj/shivam-new-profile-github-2-png.jpg',
                width: 144,
                height: 144,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 144,
                  height: 144,
                  color: Colors.grey[200],
                  child: Icon(Icons.person, size: 64, color: Colors.grey[500]),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 12,
          children: [
            _SocialIcon(
              icon: Icons.language,
              label: 'Portfolio',
              url: 'https://v0-shivam-bhatt-portfolio.vercel.app/',
              background: Colors.blue,
              iconColor: Colors.white,
            ),
            _SocialIcon(
              icon: Icons.email_outlined,
              label: 'Email',
              url: 'mailto:shisa3023@gmail.com',
              background: Colors.orange,
              iconColor: Colors.white,
            ),
            _SocialIcon(
              icon: Icons.code,
              label: 'GitHub',
              url: 'https://github.com/Shivambhatt2305',
              background: Colors.black,
              iconColor: Colors.white,
            ),
          ],
        ),
      ],
    );

    // Build the right column with all portfolio details
    final rightChildren = <Widget>[
      Text(
        'Shivam Bhatt',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.grey[900],
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        'AI/ML Innovator & Full-Stack Developer',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          ElevatedButton.icon(
            onPressed: () => _showLink(context, 'mailto:shisa3023@gmail.com'),
            icon: const Icon(Icons.mail_outline),
            label: const Text('Contact'),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: () => _showLink(
              context,
              'https://v0-shivam-bhatt-portfolio.vercel.app/',
            ),
            icon: const Icon(Icons.open_in_new),
            label: const Text('Visit portfolio'),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Text(
        'About',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.grey[900],
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        "I'm a passionate and driven ICT student (B.Tech) currently in Semester 4 with a strong focus on AI, machine learning, and software development. I enjoy solving hard problems, building products, and competing in hackathons. I have 13+ projects, a 9.0 CGPA, participated in 10+ hackathons and filed a patent for a Smart Helmet innovation.",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
      ),
      const SizedBox(height: 16),
      Text(
        'Skills',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.grey[900],
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: const [
          Chip(label: Text('Flutter')),
          Chip(label: Text('Dart')),
          Chip(label: Text('Python')),
          Chip(label: Text('ML')),
          Chip(label: Text('IoT')),
        ],
      ),
      const SizedBox(height: 16),
      Text(
        'Featured Projects',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.grey[900],
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      _ProjectCard(
        title: 'Smart Gurukul',
        subtitle: 'AI-powered virtual learning platform',
        date: 'June 2025 - Present',
        tags: ['Python', 'Flask', 'Postgres'],
      ),
      const SizedBox(height: 8),
      _ProjectCard(
        title: 'LogiTrack',
        subtitle: 'Logistics optimization platform',
        date: 'FedEx Hackathon 2025',
        tags: ['React', 'Node', 'Python'],
      ),
      const SizedBox(height: 16),
      Text(
        'Professional Experience',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.grey[900],
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      _ExperienceCard(
        role: 'Associate Software Engineer AI - Intern',
        company: 'TSS Consultancy Pvt Ltd',
        date: 'June 2025 - July 2025',
        bullets: [
          'Led development of Smart Gurukul AI-powered learning platform',
          'Built context-aware chatbot using LLMs with TTS integration',
        ],
      ),
      const SizedBox(height: 16),
      Text(
        "Let's Build Something Amazing",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.grey[900],
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          ElevatedButton.icon(
            onPressed: () => _showLink(context, 'mailto:shisa3023@gmail.com'),
            icon: const Icon(Icons.mail_outline),
            label: const Text('Email'),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: () =>
                _showLink(context, 'https://github.com/Shivambhatt2305'),
            icon: const Icon(Icons.code),
            label: const Text('GitHub'),
          ),
        ],
      ),
    ];

    if (isNarrow) {
      return [
        left,
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rightChildren,
          ),
        ),
      ];
    }

    return [
      Expanded(flex: 4, child: left),
      const SizedBox(width: 24),
      Expanded(
        flex: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rightChildren,
        ),
      ),
    ];
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  final Color background;
  final Color iconColor;

  const _SocialIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.url,
    this.background = const Color(0xFFE0E7FF),
    this.iconColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: InkWell(
        onTap: () => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Open link: $url'))),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoCard({Key? key, required this.title, required this.subtitle})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String date;
  final List<String> bullets;

  const _ExperienceCard({
    Key? key,
    required this.role,
    required this.company,
    required this.date,
    required this.bullets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              '$company • $date',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            ...bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        b,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final List<String> tags;

  const _ProjectCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  date,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: tags.map((t) => Chip(label: Text(t))).toList(),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
