import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
            // Logo centrado
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

            // Botones de acción (derecha)
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
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 28,
                      ),
                      onPressed: () {},
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
                    Tab(text: 'Actividades'),
                    Tab(text: 'Historial'),
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
          // Pestaña Actividades
          _buildActivitiesTab(),

          // Pestaña Historial
          _buildHistoryTab(),
        ],
      ),
    );
  }

  Widget _buildActivitiesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildActivityCard(
            user: 'starrysMex23',
            time: '10 min',
            activity: 'Gano el Ranking en C++',
          ),
          const SizedBox(height: 16),
          _buildActivityCard(
            user: 'starrysMex23',
            time: '25 min',
            activity: 'Completo el curso P.O.O',
          ),
          const SizedBox(height: 16),
          _buildActivityCard(
            user: 'starrysMex23',
            time: '1 hora',
            activity: 'Creo Curso: Python 4doomis',
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildActivityCard(
            user: 'starrysMex23',
            time: 'Ayer',
            activity: 'Se inscribió el curso P.A.W.I',
            showNumber: true,
            number: 4,
          ),
          const SizedBox(height: 16),
          _buildActivityCard(
            user: 'starrysMex23',
            time: '2 días',
            activity: 'Gano una medalla',
            showNumber: true,
            number: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard({
    required String user,
    required String time,
    required String activity,
    bool showNumber = false,
    int? number,
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
                if (showNumber && number != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '$number.',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                CircleAvatar(child: Text(user[0])),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(activity),
          ],
        ),
      ),
    );
  }
}
