import 'package:flutter/material.dart';

class spendingsComponent extends StatelessWidget {
  const spendingsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Budget Summary',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 275,
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Total Budget',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$5000',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Remaining Budget',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$3000',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text(
                    'Groceries',
                  ),
                  subtitle: Text(
                    'March 1, 2023',
                  ),
                  trailing: Text(
                    '-\$50',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Salary',
                  ),
                  subtitle: Text(
                    'March 1, 2023',
                  ),
                  trailing: Text(
                    '\$2000',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Utilities',
                  ),
                  subtitle: Text(
                    'February 28, 2023',
                  ),
                  trailing: Text(
                    '-\$100',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Dining Out',
                  ),
                  subtitle: Text(
                    'February 27, 2023',
                  ),
                  trailing: Text(
                    '-\$30',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Actions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add Expense',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'View Reports',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
