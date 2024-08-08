// ignore_for_file: unused_element

part of 'gemini_voice_bloc.dart';

final _contentSystemInstruction = Content.system(
  '''
Listen for the user intent when making a transaction within the app.
Is it want to pay, tranfer, or seeing the balance.
They're likely using bahasa indonesia.
Use Bahasa Indonesia and its localization to interact.
Mind that QRIS in indonesian is usually spelled as Chris, Keris, Greece, Kiris, Kriss.
''',
);

Future<GenieRespose<int>> _payWithQRIS(
  Map<String, Object?> arguments,
) async {
  // return {
  //   'isPayingWithQRIS': arguments['isPayingWithQRIS'],
  //   'amount': arguments['amount'],
  // };

  final amount = arguments['amount'] as num?;

  return GenieRespose<int>(
    pushNamedRoute: QRISRoute.name,
    data: amount?.toInt(),
  );
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _payWithQRISTool = FunctionDeclaration(
  'payWithQRIS',
  '''Check if a user wants to pay an summarized order or if they want to pay with QRIS with or without mentioned amount''',
  Schema(
    SchemaType.object,
    properties: {
      'isPayingWithQRIS': Schema(
        SchemaType.boolean,
        description:
            '''Is the user wants to pay an summarized order or if they want to pay with QRIS with mentioned amount?''',
      ),
      'amount': Schema(
        SchemaType.number,
        description: '''The number mentioned in the sentence''',
      ),
    },
    requiredProperties: ['isPayingWithQRIS'],
  ),
);

Future<Map<String, Object?>> _transfer(
  Map<String, Object?> arguments,
) async {
  return {
    'isInitiatingTransfer': arguments['isInitiatingTransfer'],
    'name': arguments['name'],
    'amount': arguments['amount'],
  };
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _transferTool = FunctionDeclaration(
  'transfer',
  'Check if a user wants to pay with QRIS with or without mentioned amount',
  Schema(
    SchemaType.object,
    properties: {
      'isInitiatingTransfer': Schema(
        SchemaType.boolean,
        description: '''Is the user wants to make a transfer with someone''',
      ),
      'name': Schema(
        SchemaType.string,
        description: '''The name of the person mentioned in the sentence''',
      ),
      'amount': Schema(
        SchemaType.number,
        description: '''The number mentioned in the sentence''',
      ),
    },
    requiredProperties: ['isPayingWithQRIS', 'name'],
  ),
);

Future<Map<String, Object?>> _payWithOnline(
  Map<String, Object?> arguments,
) async {
  return {
    'isOnlinePaying': arguments['isOnlinePaying'],
    'channel': arguments['channel'],
    'amount': arguments['amount'],
  };
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _payWithOnlineTool = FunctionDeclaration(
  'payWithOnline',
  '''Check if a user wants to pay with online payment through indonesian bills with or without mentioned amount''',
  Schema(
    SchemaType.object,
    properties: {
      'isOnlinePaying': Schema(
        SchemaType.boolean,
        description:
            '''Is the user wants to make a payment with built in channels for online payment bills''',
      ),
      'channel': Schema(
        SchemaType.string,
        description: '''The name of the channel mentioned in the sentence''',
      ),
      'amount': Schema(
        SchemaType.number,
        description: '''The number mentioned in the sentence''',
      ),
    },
    requiredProperties: ['isOnlinePaying', 'channel'],
  ),
);

// GenieRespose(
//             data: data,
//             message: response.text,
//             pushNamedRoute: pushNamedRoute,
//           );

Future<GenieRespose<BillSummary>?> _summarizingOrder(
  Map<String, Object?> arguments,
) async {
  // log('debug arguments $arguments');
  final isSummarizingOrder = arguments['isSummarizingOrder'] as bool?;

  if (isSummarizingOrder == null) return null;

  final lineItems = arguments['lineItems'] as List<dynamic>?;

  if (lineItems == null) return null;
  log('debug lineItems $lineItems');

  final billItems = <BillItem>[];
  for (var i = 0; i < lineItems.length; i++) {
    final item = lineItems[i] as Map<String, Object?>;
    final name = item['name'] as String?;
    final price = item['price'] as num?;
    final quantity = item['quantity'] as num?;
    billItems.add(
      BillItem(
        id: '''${i + 1}_${name?.splitMapJoin(' ', onMatch: (_) => '').toLowerCase()}''',
        name: name,
        quantity: int.tryParse('$quantity'),
        price: int.tryParse('$price'),
      ),
    );
  }
  final grandTotal = arguments['grandTotal'] as num?;

  return GenieRespose<BillSummary>(
    pushNamedRoute: BillSummarizerRoute.name,
    data: BillSummary(
      id: '',
      billItems: billItems,
      grandTotal: grandTotal?.toInt(),
    ),
  );
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _summarizingOrderTool = FunctionDeclaration(
  'summarizingOrder',
  '''Check if the description is a order summary with or without mentioned amount''',
  Schema(
    SchemaType.object,
    properties: {
      'isSummarizingOrder': Schema(
        SchemaType.boolean,
        description: '''is the text is an order summary?''',
      ),
      'lineItems': Schema.array(
        description:
            '''The list of items ordered with the name and the price in the sentence''',
        items: Schema(
          SchemaType.object,
          properties: {
            'name': Schema(
              SchemaType.string,
              description: '''The name of the item mentioned in the sentence''',
            ),
            'price': Schema(
              SchemaType.number,
              description: '''The number of price mentioned in the sentence''',
            ),
            'quantity': Schema(
              SchemaType.number,
              description:
                  '''The number of quantity of item mentioned in the sentence''',
            ),
          },
          requiredProperties: ['name', 'price'],
        ),
      ),
      'grandTotal': Schema(
        SchemaType.number,
        description: '''
The number of grand total of items that might be mentioned in the sentence.
But if none, you got to count it yourself. Thanks''',
      ),
    },
    requiredProperties: ['isSummarizingOrder', 'lineItems', 'grandTotal'],
  ),
);
