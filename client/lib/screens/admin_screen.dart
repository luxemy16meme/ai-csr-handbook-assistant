import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin • Handbook Manager"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Handbook Upload",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {
                // PDF picker later
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload PDF Handbook"),
            ),

            const SizedBox(height: 24),

            const Text(
              "Uploaded Files",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: ListView(
                children: const [
                  HandbookTile(
                    fileName: "Student_Handbook_2025.pdf",
                    status: "Processed",
                  ),
                  HandbookTile(
                    fileName: "Registrar_Policies.pdf",
                    status: "Pending",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Handbook File Tile Widget//

class HandbookTile extends StatelessWidget {
  final String fileName;
  final String status;

  const HandbookTile({super.key, required this.fileName, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
        title: Text(fileName),
        subtitle: Text("Status: $status"),
        trailing: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // process / reprocess later
          },
        ),
      ),
    );
  }
}
