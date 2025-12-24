import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  _BankScreenState createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic>? _bankDetails;
  bool _loading = false;
  String? _error;

  Future<void> _fetchBankDetails(String ifsc) async {
    setState(() {
      _loading = true;
      _error = null;
      _bankDetails = null;
    });

    final url = Uri.parse('https://ifsc.razorpay.com/${ifsc.trim()}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _bankDetails = data;
        });
      } else {
        setState(() {
          _error = 'No details found for IFSC: $ifsc';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _buildDetailTile(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value.isNotEmpty ? value : "N/A"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bank Lookup',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Field
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter IFSC code...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                if (value.isNotEmpty) _fetchBankDetails(value);
              },
            ),

            const SizedBox(height: 20),

            // ⏳ Loading, Error, or Data Display
            if (_loading)
              const Center(child: CircularProgressIndicator())
            else if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              )
            else if (_bankDetails != null)
              Expanded(
                child: ListView(
                  children: [
                    _buildDetailTile(
                      'Bank Name',
                      _bankDetails!['BANK'] ?? '',
                      Icons.account_balance,
                    ),
                    _buildDetailTile(
                      'Branch',
                      _bankDetails!['BRANCH'] ?? '',
                      Icons.location_city,
                    ),
                    _buildDetailTile(
                      'IFSC Code',
                      _bankDetails!['IFSC'] ?? '',
                      Icons.numbers,
                    ),
                    _buildDetailTile(
                      'MICR Code',
                      _bankDetails!['MICR']?.toString() ?? '',
                      Icons.confirmation_number,
                    ),
                    _buildDetailTile(
                      'Address',
                      _bankDetails!['ADDRESS'] ?? '',
                      Icons.home,
                    ),
                    _buildDetailTile(
                      'City',
                      _bankDetails!['CITY'] ?? '',
                      Icons.location_on,
                    ),
                    _buildDetailTile(
                      'District',
                      _bankDetails!['DISTRICT'] ?? '',
                      Icons.map,
                    ),
                    _buildDetailTile(
                      'State',
                      _bankDetails!['STATE'] ?? '',
                      Icons.flag,
                    ),
                    _buildDetailTile(
                      'Bank Code',
                      _bankDetails!['BANKCODE'] ?? '',
                      Icons.code,
                    ),
                    _buildDetailTile(
                      'Centre',
                      _bankDetails!['CENTRE'] ?? '',
                      Icons.apartment,
                    ),
                  ],
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Text(
                    'Enter an IFSC code to view details',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
