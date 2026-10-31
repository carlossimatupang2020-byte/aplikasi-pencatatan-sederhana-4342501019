import 'package:flutter/material.dart';

// --- DEFINISI PALET WARNA (Teori 60-30-10) ---
// 10% Aksen (Warna Utama)
const Color colorAccent = Color(0xFF0095FF); 

// 30% Sekunder (Highlight & Teks)
const Color colorSecondarySurface = Color(0xFFE6F4FF); 
const Color colorTextPrimary = Color(0xFF1E293B);
const Color colorTextSecondary = Color(0xFF64748B);

// 60% Dominan (Background)
const Color colorDominantBg = Color(0xFFF8FAFC);
const Color colorSurface = Color(0xFFFFFFFF);

void main() {
  runApp(const CatatanKuApp());
}

class CatatanKuApp extends StatelessWidget {
  const CatatanKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatatanKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorAccent),
        useMaterial3: true,
        scaffoldBackgroundColor: colorDominantBg, // 60%
        fontFamily: 'Roboto', // Opsional, memastikan font rapi
      ),
      home: const SplashScreen(),
    );
  }
}

// ==========================================
// 1. SPLASH SCREEN
// ==========================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [colorSecondarySurface, colorSurface], // 30% ke 60%
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: colorAccent, // 10% Aksen
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: colorAccent.withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.edit_note_rounded,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'CatatanKu',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorTextPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Simpan setiap ide, rencana, dan momen berharga dalam satu tempat.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: colorTextSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(colorAccent), // 10%
                        backgroundColor: colorSecondarySurface, // 30%
                        minHeight: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. LOGIN STATIS SCREEN
// ==========================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorAccent, // 10%
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.edit_note_rounded,
                  size: 52,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'CatatanKu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorTextPrimary,
                ),
              ),
              const Text(
                'Masuk untuk melanjutkan',
                style: TextStyle(color: colorTextSecondary, fontSize: 14),
              ),
              const SizedBox(height: 32),
              _buildTextField(icon: Icons.email_outlined, hint: 'Email'),
              const SizedBox(height: 16),
              _buildTextField(
                icon: Icons.lock_outline,
                hint: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorAccent, // 10% Aksen CTA
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text(
                    'Masuk',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text('atau', style: TextStyle(color: colorTextSecondary, fontSize: 12)),
                  ),
                  Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: colorSurface, // 60%
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  icon: const Icon(Icons.g_mobiledata, size: 28, color: Colors.red),
                  label: const Text(
                    'Masuk dengan Google',
                    style: TextStyle(color: colorTextPrimary, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required IconData icon, required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: isPassword ? const Icon(Icons.remove_red_eye_outlined, color: Colors.grey) : null,
        hintText: hint,
        filled: true,
        fillColor: colorSurface, // 60%
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: colorAccent, width: 2), // 10% saat fokus
        ),
      ),
    );
  }
}

// ==========================================
// 3. BERANDA SCREEN
// ==========================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> notes = [
    {
      'title': 'Ide Aplikasi',
      'date': '19 Oktober 2026',
      'icon': Icons.lightbulb_outline,
      'color': Colors.amber.shade100,
      'iconColor': Colors.amber.shade800,
    },
    {
      'title': 'Rencana Mingguan',
      'date': '18 Oktober 2026',
      'icon': Icons.calendar_today_outlined,
      'color': colorSecondarySurface, // 30% warna terpadu
      'iconColor': colorAccent, // 10%
    },
    {
      'title': 'Catatan Kuliah',
      'date': '17 Oktober 2026',
      'icon': Icons.menu_book_outlined,
      'color': Colors.purple.shade50,
      'iconColor': Colors.purple.shade700,
    },
    {
      'title': 'Hal yang Perlu Dibeli',
      'date': '16 Oktober 2026',
      'icon': Icons.shopping_cart_outlined,
      'color': Colors.pink.shade50,
      'iconColor': Colors.pink.shade700,
    },
    {
      'title': 'Jurnal Harian',
      'date': '15 Oktober 2026',
      'icon': Icons.favorite_border_rounded,
      'color': colorSecondarySurface, 
      'iconColor': colorAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Halo,\nAhmadi 👋',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1.2, color: colorTextPrimary),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Apa yang ingin kamu catat hari ini?',
                        style: TextStyle(color: colorTextSecondary, fontSize: 13),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: colorSecondarySurface, // 30%
                    child: const Icon(Icons.person, color: colorAccent), // 10%
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        hintText: 'Cari catatan...',
                        filled: true,
                        fillColor: colorSurface, // 60%
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorSurface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: colorTextSecondary),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Semua', isSelected: true),
                    _buildCategoryChip('Penting'),
                    _buildCategoryChip('Pribadi'),
                    _buildCategoryChip('Kerja'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: colorSurface, // 60%
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFF1F5F9)),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DetailCatatanScreen()),
                          );
                        },
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: note['color'],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(note['icon'], color: note['iconColor'], size: 22),
                        ),
                        title: Text(
                          note['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: colorTextPrimary),
                        ),
                        subtitle: Text(
                          note['date'],
                          style: const TextStyle(color: colorTextSecondary, fontSize: 12),
                        ),
                        trailing: const Icon(Icons.more_vert, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorAccent, // 10%
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahCatatanScreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: colorAccent, // 10%
        unselectedItemColor: colorTextSecondary,
        backgroundColor: colorSurface,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_outlined), label: 'Arsip'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : colorTextSecondary,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? colorAccent : colorSurface, // 10% / 60%
        side: isSelected ? BorderSide.none : const BorderSide(color: Color(0xFFE2E8F0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

// ==========================================
// 4. TAMBAH CATATAN SCREEN
// ==========================================
class TambahCatatanScreen extends StatefulWidget {
  const TambahCatatanScreen({super.key});

  @override
  State<TambahCatatanScreen> createState() => _TambahCatatanScreenState();
}

class _TambahCatatanScreenState extends State<TambahCatatanScreen> {
  int _selectedColorIndex = 0;
  int _selectedPriorityIndex = 1;

  final List<Color> _colors = [
    colorAccent, // Pilihan warna utama
    const Color(0xFFA7F3D0),
    const Color(0xFFFDE68A),
    const Color(0xFFFBCFE8),
    const Color(0xFFDDD6FE),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colorTextPrimary)),
        centerTitle: true,
        backgroundColor: colorDominantBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: colorTextPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Judul Catatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: colorTextPrimary)),
            const SizedBox(height: 8),
            _buildInputField(hint: 'Masukkan judul catatan'),
            const SizedBox(height: 20),
            const Text('Isi Catatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: colorTextPrimary)),
            const SizedBox(height: 8),
            _buildInputField(hint: 'Tulis catatan Anda di sini...', maxLines: 5),
            const SizedBox(height: 20),
            const Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: colorTextPrimary)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
                filled: true,
                fillColor: colorSurface, // 60%
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: colorAccent, width: 2),
                ),
              ),
              hint: const Text('Pilih kategori'),
              items: const [
                DropdownMenuItem(value: 'Penting', child: Text('Penting')),
                DropdownMenuItem(value: 'Pribadi', child: Text('Pribadi')),
                DropdownMenuItem(value: 'Kerja', child: Text('Kerja')),
              ],
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            const Text('Warna', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: colorTextPrimary)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _colors.length,
                (index) => GestureDetector(
                  onTap: () => setState(() => _selectedColorIndex = index),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: _colors[index],
                    child: _selectedColorIndex == index
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Prioritas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: colorTextPrimary)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildPriorityOption('Rendah', 0),
                const SizedBox(width: 8),
                _buildPriorityOption('Sedang', 1),
                const SizedBox(width: 8),
                _buildPriorityOption('Tinggi', 2),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorAccent, // 10%
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required String hint, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: colorSurface, // 60%
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: colorAccent, width: 2), // 10% saat aktif
        ),
      ),
    );
  }

  Widget _buildPriorityOption(String label, int index) {
    bool isSelected = _selectedPriorityIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPriorityIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? colorAccent : colorSurface, // 10% / 60%
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? colorAccent : const Color(0xFFE2E8F0),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : colorTextSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 5. DETAIL CATATAN SCREEN
// ==========================================
class DetailCatatanScreen extends StatelessWidget {
  const DetailCatatanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colorTextPrimary)),
        centerTitle: true,
        backgroundColor: colorDominantBg, // 60%
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: colorTextPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: colorTextPrimary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorSecondarySurface, // 30% Sekunder untuk highlight yang lembut
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('💡 ', style: TextStyle(fontSize: 20)),
                      Text(
                        'Ide Aplikasi',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorAccent), // 10% Aksen
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorAccent.withValues(alpha: 0.15), // Turunan Aksen
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Penting',
                      style: TextStyle(fontSize: 11, color: colorAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Icon(Icons.calendar_today_outlined, size: 16, color: colorTextSecondary),
                SizedBox(width: 6),
                Text('19 Oktober 2026', style: TextStyle(color: colorTextSecondary, fontSize: 13)),
                SizedBox(width: 12),
                Icon(Icons.access_time, size: 16, color: colorTextSecondary),
                SizedBox(width: 4),
                Text('09.30', style: TextStyle(color: colorTextSecondary, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Ide untuk membuat aplikasi catatan sederhana dengan fitur kategori, warna, dan prioritas. Aplikasi ini digunakan untuk mencatat ide, rencana, dan hal penting sehari-hari.',
              style: TextStyle(
                fontSize: 14,
                color: colorTextPrimary, // 30% Teks Utama
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}