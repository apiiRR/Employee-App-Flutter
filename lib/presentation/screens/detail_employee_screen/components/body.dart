import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          width: size.width,
          color: Colors.purple,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const Icon(
                Icons.person,
                color: Colors.white,
                size: 160,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Rafi Ramadhana",
                style: TextStyle(color: Colors.white, fontSize: 32),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 1)),
              ]),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.2,
                child: const Icon(
                  Icons.email_rounded,
                  color: Colors.purple,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("rafiramadhanadev@gmail.com"),
                  Text(
                    "E-mail",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ))
            ],
          ),
        )
      ],
    );
  }
}
