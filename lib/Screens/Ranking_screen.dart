import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RankingScreen>
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
                    Tab(text: 'Ranking'),
                    Tab(text: 'Medallas'),
                    Tab(text: 'Logros'),
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
            child: Text('Contenido de Ranking', style: TextStyle(fontSize: 18)),
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

  // Método para construir un elemento de curso
  Widget _buildCourseItem({
    required String creator,
    required String title,
    required bool isPublic,
    required String timeAgo,
    required int likes,
    required int comments,
    required BuildContext context,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Text(creator[0])),
                const SizedBox(width: 10),
                Text(
                  creator,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Icon(
                  isPublic ? Icons.public : Icons.lock_outline,
                  size: 18,
                  color: isPublic ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 6),
                Text(
                  timeAgo,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 18,
                  color: Colors.blue[700],
                ),
                const SizedBox(width: 4),
                Text('$likes'),
                const SizedBox(width: 16),
                Icon(Icons.comment_outlined, size: 18, color: Colors.grey[700]),
                const SizedBox(width: 4),
                Text('$comments'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
