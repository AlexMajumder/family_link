import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class FamilyTreeScreen extends StatefulWidget {
  const FamilyTreeScreen({super.key});

  @override
  State<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends State<FamilyTreeScreen> {
  final Graph graph = Graph()..isTree = true;
  final ScreenshotController screenshotController = ScreenshotController();
  late BuchheimWalkerConfiguration builder;

  @override
  void initState() {
    super.initState();
    _buildTree();
  }

  void _buildTree() {
    final head = Node.Id('Head');
    final wife = Node.Id('Wife');
    final son = Node.Id('Son');
    final daughter = Node.Id('Daughter');
    final daughterInLaw = Node.Id('Daughter-in-law');
    final grandson = Node.Id('Grandson');
    final son2 = Node.Id('Second Son');
    final grandson2 = Node.Id('Grandson 2');
    final granddaughter = Node.Id('Granddaughter');

    graph.addEdge(head, wife);
    graph.addEdge(head, son);
    graph.addEdge(head, daughter);
    graph.addEdge(head, son2);

    graph.addEdge(son, daughterInLaw);
    graph.addEdge(son, grandson);

    graph.addEdge(son2, grandson2);
    graph.addEdge(son2, granddaughter);

    builder = BuchheimWalkerConfiguration()
      ..siblingSeparation = 25
      ..levelSeparation = 40
      ..subtreeSeparation = 30
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  Widget nodeWidget(String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.teal[100],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Future<void> _saveAsImage() async {
    final status = await Permission.photos.request();
    if (!status.isGranted) return;

    final image = await screenshotController.capture();
    if (image != null) {
      final result = await ImageGallerySaverPlus.saveImage(
        image,
        name: "family_tree",
      );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Saved to gallery')));
      }
    }
  }

  Future<void> _exportAsPDF() async {
    final image = await screenshotController.capture();
    if (image == null) return;

    final pdf = pw.Document();
    final pwImage = pw.MemoryImage(image);

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Center(child: pw.Image(pwImage));
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Family Tree")),
      body: Column(
        children: [
          Expanded(
            child: Screenshot(
              controller: screenshotController,
              child: InteractiveViewer(
                constrained: false,
                boundaryMargin: const EdgeInsets.all(100),
                minScale: 0.01,
                maxScale: 5.6,
                child: GraphView(
                  graph: graph,
                  algorithm: BuchheimWalkerAlgorithm(
                    builder,
                    TreeEdgeRenderer(builder),
                  ),
                  builder: (Node node) {
                    return nodeWidget(node.key!.value.toString());
                  },
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _saveAsImage,
                  icon: const Icon(Icons.image),
                  label: const Text("Save as Image"),
                ),
                ElevatedButton.icon(
                  onPressed: _exportAsPDF,
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text("Export PDF"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
