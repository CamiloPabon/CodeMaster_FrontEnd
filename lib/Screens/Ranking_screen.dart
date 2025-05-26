import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ranking C++'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Ranking'),
              Tab(text: 'Medallas'),
              Tab(text: 'Logros'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Pestaña de Ranking
            _buildRankingTab(),
            // Pestaña de Medallas
            const Center(child: Text('Contenido de Medallas')),
            // Pestaña de Logros
            const Center(child: Text('Contenido de Logros')),
          ],
        ),
      ),
    );
  }

  Widget _buildRankingTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tu puesto en el ranking',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Tu posición actual
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Text(
                    '#230',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Title',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Top 3
          const Text(
            'Top 3',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildRankingItem(
            position: 1,
            name: 'Elym Lee',
            description: 'Est. Ingeniería en sistemas 9 semestre',
          ),
          _buildRankingItem(
            position: 2,
            name: 'Oscar Dum',
            description: 'Est. Ingeniería en sistemas 10 semestre',
          ),
          _buildRankingItem(
            position: 3,
            name: 'Carlo Emilion',
            description: 'Est. Ingeniería en sistemas 4 semestre',
          ),
          // Otras posiciones (ejemplo)
          const SizedBox(height: 20),
          const Text(
            'Otros participantes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildRankingItem(
            position: 4,
            name: 'Daniela Lau Dank',
            description: '',
          ),
          // Aquí puedes agregar más items según tu API
        ],
      ),
    );
  }

  Widget _buildRankingItem({
    required int position,
    required String name,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(position.toString()),
        ),
        title: Text(name),
        subtitle: description.isNotEmpty ? Text(description) : null,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}