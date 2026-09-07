import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Doctor {
  final String initials;
  final String name;
  final String specialty;
  final bool isAvailable;
  final Color color;

  const Doctor({
    required this.initials,
    required this.name,
    required this.specialty,
    required this.isAvailable,
    required this.color,
  });
}

const List<Doctor> doctors = [
  Doctor(initials: 'HA', name: 'Dr. Hamid Ali',   specialty: 'Heart Specialist', isAvailable: true,  color: Colors.blue),
  Doctor(initials: 'SR', name: 'Dr. Sara Rehman', specialty: 'Eye Specialist',   isAvailable: true,  color: Colors.purple),
  Doctor(initials: 'AK', name: 'Dr. Asim Khan',   specialty: 'Child Specialist', isAvailable: false, color: Colors.orange),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorListScreen(),
    );
  }
}

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'DOCTORS KI LIST',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500],
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: doctors.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) => DoctorCard(doctor: doctors[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
      decoration: const BoxDecoration(
        color: Color(0xFF1565C0),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Doctor App',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          Text('Apna doctor choose karo',
              style: TextStyle(color: Color(0xFF90CAF9), fontSize: 13)),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          _Avatar(doctor: doctor),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctor.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(doctor.specialty, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            ],
          ),
          const Spacer(),
          _StatusBadge(isAvailable: doctor.isAvailable),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final Doctor doctor;
  const _Avatar({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: doctor.color.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(doctor.initials,
          style: TextStyle(color: doctor.color, fontWeight: FontWeight.w600, fontSize: 15)),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isAvailable;
  const _StatusBadge({required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isAvailable ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isAvailable ? 'Available' : 'Busy',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isAvailable ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
        ),
      ),
    );
  }
}