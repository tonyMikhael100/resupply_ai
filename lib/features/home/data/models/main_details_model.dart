class MainDetailsResponse {
  final List<RowItem> items;
  final String cleft;
  final String cright;

  MainDetailsResponse({
    required this.items,
    required this.cleft,
    required this.cright,
  });

  factory MainDetailsResponse.fromJson(List<dynamic> json) {
    final dataObject = json[0] as Map<String, dynamic>? ?? {};
    final colorObject =
        json.length > 1 ? json[1] as Map<String, dynamic>? ?? {} : {};

    // Get list safely
    final List<dynamic>? nsnList = dataObject["NSN"] as List<dynamic>?;

    final int count = nsnList?.length ?? 0;

    List<RowItem> items = List.generate(count, (i) {
      return RowItem(
        nsn: nsnList?[i] ?? "",
        quoteBy: dataObject["Quote By"]?[i] ?? "",
        name: dataObject["Name"]?[i] ?? "",
        partNo: dataObject["PartNo"]?[i] ?? "",
        lastPrice: dataObject["LastPrice"]?[i] ?? "",
        qty: dataObject["Qty"]?[i] ?? "",
        manufacturer: dataObject["Manufacturer"]?[i] ?? "",
        notes: dataObject["Notes"]?[i] ?? "",
        uid: dataObject["uid"]?[i]?.toString() ?? "",
        action: dataObject["action"]?[i] ?? "",
        buttonText: dataObject["buttext"]?[i] ?? "",
        buttonColor: dataObject["butcolor"]?[i] ?? "",
      );
    });

    return MainDetailsResponse(
      items: items,
      cleft: colorObject["cleft"] ?? "",
      cright: colorObject["cright"] ?? "",
    );
  }
}

class RowItem {
  final String nsn;
  final String quoteBy;
  final String name;
  final String partNo;
  final String lastPrice;
  final String qty;
  final String manufacturer;
  final String notes;
  final String uid;
  final String action;
  final String buttonText;
  final String buttonColor;

  RowItem({
    required this.nsn,
    required this.quoteBy,
    required this.name,
    required this.partNo,
    required this.lastPrice,
    required this.qty,
    required this.manufacturer,
    required this.notes,
    required this.uid,
    required this.action,
    required this.buttonText,
    required this.buttonColor,
  });
}
