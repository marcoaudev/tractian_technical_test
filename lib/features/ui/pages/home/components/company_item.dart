import 'package:flutter/material.dart';
import 'package:tractian_technical_test/features/domain/entities/company.dart';

class CompanyItem extends StatelessWidget {
  final CompanyEntity company;

  const CompanyItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/asset',
          arguments: {"name": company.name},
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromRGBO(33, 136, 255, 1),
        ),
        child: Center(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              Text(
                "${company.name} UNIT",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
