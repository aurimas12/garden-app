// lib/screens/pin_login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/api.dart';
import '../data/session.dart';
import '../models/task.dart';
import '../screens/main_screen.dart';

class PinLoginPage extends StatefulWidget {
  final Map<String, List<Task>> sections;
  const PinLoginPage({super.key, required this.sections});

  @override
  State<PinLoginPage> createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  final _c = TextEditingController();
  bool _busy = false;
  String? _error;

  Future<void> _doLogin() async {
    final pin = _c.text.trim();
    if (pin.length != 6) {
      setState(() => _error = 'Įvesk 6 skaitmenų PIN');
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final accountId = await AuthApi.loginPin(pin);
      await Session.saveAccountId(accountId);

      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MainScreen(sections: widget.sections),
        ),
      );
    } catch (e) {
      setState(() => _error = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canSubmit = _c.text.trim().length == 6 && !_busy;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FFF7),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_florist, size: 40, color: Colors.green[700]),
                  const SizedBox(height: 8),
                  Text(
                    'Prisijungimas',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _c,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'PIN (6 sk.)',
                      hintText: '••••••',
                      counterText: '',
                      errorText: _error,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged:
                        (_) => setState(() {}), // atnaujins mygtuko enabled
                    onSubmitted: (_) {
                      if (canSubmit) _doLogin();
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: canSubmit ? _doLogin : null,
                      icon:
                          _busy
                              ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : const Icon(Icons.login),
                      label: Text(_busy ? 'Jungiama...' : 'Prisijungti'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
