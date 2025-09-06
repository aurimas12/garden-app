import 'package:flutter/material.dart';

/// Vaikai gali priregistruoti „prieš pereinant“ darbą (pvz. validacija, siuntimas).
/// Jei callback grąžina true -> einame „Toliau/Užbaigti“, jei false -> liekame tame pačiame psl.
class RegisterOnNextNotification extends Notification {
  final Future<bool> Function()? beforeNext;
  const RegisterOnNextNotification(this.beforeNext);
}

class PagedTaskScreen extends StatefulWidget {
  final String title;
  final VoidCallback onFinish;
  final List<Widget> pages;
  final String? taskCode; // jeigu nori turėti užduoties kodą (nebūtina)

  const PagedTaskScreen({
    super.key,
    required this.title,
    required this.onFinish,
    required this.pages,
    this.taskCode,
  });

  @override
  State<PagedTaskScreen> createState() => _PagedTaskScreenState();
}

class _PagedTaskScreenState extends State<PagedTaskScreen> {
  late final PageController _controller;
  int _index = 0;

  bool get _isFirst => _index == 0;
  bool get _isLast => _index == widget.pages.length - 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  Future<void> _tryGoNext({Future<bool> Function()? beforeNext}) async {
    // 1) jeigu puslapis priregistravo “beforeNext” – vykdom
    if (beforeNext != null) {
      final ok = await beforeNext();
      if (!ok) return;
    }
    // 2) pereinam
    if (_isLast) {
      widget.onFinish();
      if (mounted) Navigator.of(context).pop();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    }
  }

  void _goPrev() {
    if (_isFirst) return;
    _controller.previousPage(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F5EC),
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.green),
      body: NotificationListener<RegisterOnNextNotification>(
        onNotification: (n) {
          // Vaiko page kažką patikrino/įrašė ir paprašė pereiti
          _tryGoNext(beforeNext: n.beforeNext);
          return true;
        },
        child: Column(
          children: [
            const SizedBox(height: 10),
            // indikatorius
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.pages.length, (i) {
                final active = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: active ? 22 : 8,
                  decoration: BoxDecoration(
                    color: active ? Colors.green : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),
            // turinys
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FFF4),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: PageView.builder(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (i) => setState(() => _index = i),
                  itemCount: widget.pages.length,
                  itemBuilder:
                      (_, i) => SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: widget.pages[i],
                      ),
                ),
              ),
            ),
            // apačios juosta
            SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                color: const Color(0xFFF8FFF4),
                child: Row(
                  children: [
                    OutlinedButton(
                      onPressed: _isFirst ? null : _goPrev,
                      child: const Text('Atgal'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => _tryGoNext(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(_isLast ? 'Užbaigti' : 'Toliau'),
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
