import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            // Logo centrado absolutamente en toda la pantalla
            Center(
              child: SizedBox(
                height: 80,
                child: Image.asset(
                  'assets/images/iconLight.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error cargando imagen: $error');
                    return const Icon(Icons.error, size: 80);
                  },
                ),
              ),
            ),

            // Contenedor para los botones de acción (derecha)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, size: 28),
                      onPressed: () {
                        // Acción de búsqueda
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 28,
                      ),
                      onPressed: () {
                        // Acción de notificaciones
                      },
                    ),
                  ],
                ),
              ),
            ),

            // TabBar en la parte inferior
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Tus cursos'),
                    Tab(text: 'Recomendaciones'),
                    Tab(text: 'Tus likes'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          // Contenido pestaña "Tus cursos"
          const Center(
            child: Text(
              'Contenido de Tus cursos',
              style: TextStyle(fontSize: 18),
            ),
          ),

          // Contenido pestaña "Recomendaciones"
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildCourseItem(
                creator: 'Helena',
                title: 'Introducción a Flutter',
                isPublic: true,
                timeAgo: 'Hace 3 minutos',
                likes: 21,
                comments: 4,
                context: context,
              ),
              const SizedBox(height: 16),
              _buildCourseItem(
                creator: 'Efraín',
                title: 'Dart avanzado',
                isPublic: false,
                timeAgo: 'Hace 1 hora',
                likes: 15,
                comments: 3,
                context: context,
              ),
              const SizedBox(height: 16),
              _buildCourseItem(
                creator: 'María',
                title: 'Diseño UI/UX',
                isPublic: true,
                timeAgo: 'Ayer',
                likes: 42,
                comments: 7,
                context: context,
              ),
            ],
          ),

          // Contenido pestaña "Tus likes"
          const Center(
            child: Text(
              'Contenido de Tus likes',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseItem({
    required String creator,
    required String title,
    required bool isPublic,
    required String timeAgo,
    required int likes,
    required int comments,
    required BuildContext context,
  }) {
    final ThemeData theme = Theme.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    // Imagen de perfil aleatoria diferente para cada creador
                    'https://randomuser.me/api/portraits/${creator == 'Helena'
                        ? 'women/65'
                        : creator == 'Efraín'
                        ? 'men/22'
                        : 'women/33'}.jpg',
                  ),
                  onBackgroundImageError: (_, __) {},
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$creator creó el curso $title',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        timeAgo,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  // Imagen diferente según el título del curso
                  image: NetworkImage(
                    title.contains('Flutter')
                        ? 'https://placehold.co/600x300/1a237e/ffffff?text=Flutter+Course'
                        : title.contains('Dart')
                        ? 'https://placehold.co/600x300/01579b/ffffff?text=Dart+Advanced'
                        : 'https://placehold.co/600x300/4a148c/ffffff?text=UI/UX+Design',
                  ),
                  fit: BoxFit.cover,
                  onError: (_, __) {},
                ),
              ),
            ),
            const SizedBox(height: 12),
            Chip(
              label: Text(
                isPublic ? 'Curso público' : 'Curso privado',
                style: TextStyle(
                  color: isPublic ? Colors.green[700] : Colors.orange[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor:
                  isPublic ? Colors.green[100] : Colors.orange[100],
              avatar: Icon(
                isPublic ? Icons.lock_open_outlined : Icons.lock_outline,
                size: 16,
                color: isPublic ? Colors.green[700] : Colors.orange[700],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.link, size: 18),
                  label: const Text('Unirse'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$likes',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.comment_outlined,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$comments',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
