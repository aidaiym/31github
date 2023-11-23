import 'package:flutter/material.dart';

class VacanciesList extends StatelessWidget {
  const VacanciesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return  Column(
                children: [
                  const Row(
                    children: [
                      CircleAvatar(),
                      Column(
                        children: [
                          Text('data'),
                          Text('data'),
                        ],
                      ),
                    ],
                  ),
                  const Wrap(
                    children: [Card(child: Text('Full-Time'),), Card(child: Text('Remote'),)],
                  ),
                  const Text('Salary'),
                  ElevatedButton(onPressed: (){}, child: const Text('Apply'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
