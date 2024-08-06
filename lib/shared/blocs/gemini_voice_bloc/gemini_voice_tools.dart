part of 'gemini_voice_bloc.dart';

Future<Map<String, Object?>> _payWithQRIS(
  Map<String, Object?> arguments,
) async {
  return {
    'isPayingWithQRIS': arguments['isPayingWithQRIS'],
    'amount': arguments['amount'],
  };
  // This hypothetical API returns a JSON such as:
  // {"base":"USD","date":"2024-04-17","rates":{"SEK": 10.99}}
}

final _payWithQRISTool = FunctionDeclaration(
  'payWithQRIS',
  'Check if a user wants to pay with QRIS with or without mentioned amount',
  Schema(
    SchemaType.object,
    properties: {
      'isPayingWithQRIS': Schema(
        SchemaType.boolean,
        description: '''Is the user wants to pay with QRIS?''',
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
