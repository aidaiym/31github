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
                  Row(
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
                  Wrap(
                    children: [Card(child: Text('Full-Time'),), Card(child: Text('Remote'),)],
                  ),
                  Text('Salary'),
                  ElevatedButton(onPressed: (){}, child: Text('Apply'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
