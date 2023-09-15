enum ProductType {
  bread,
  milk,
  water,
  none;

  static ProductType from(String string) {
    switch (string.toLowerCase()) {
      case "хлеб":
        return ProductType.bread;
      case "молоко":
        return ProductType.milk;
      case "вода":
        return ProductType.water;
      default:
        return ProductType.none;
    }
  }

  String name() {
    switch (this) {
      case ProductType.bread:
        return "хлеб";
      case ProductType.milk:
        return "молоко";
      case ProductType.water:
        return "вода";
      case ProductType.none:
        return "товар";
    }
  }
}

abstract class Filter<Item> {
  bool apply(Item item);
}

abstract class ICategorySupportable {
  late final ProductType type;
}

abstract class IPriceSupportable {
  late final int price;
}

abstract class ICountSupportable {
  late final int count;
}

final class CategoryFilter extends Filter<ICategorySupportable> {
  final List<ProductType> types;

  CategoryFilter(this.types);

  @override
  bool apply(item) {
    return types.contains(item.type);
  }
}

final class PriceFilter extends Filter<IPriceSupportable> {
  final int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(item) {
    return item.price <= maxPrice;
  }
}

final class CountFilter extends Filter<ICountSupportable> {
  final int count;

  CountFilter(this.count);

  @override
  bool apply(item) {
    return item.count <= count;
  }
}

final class Product
    implements ICategorySupportable, ICountSupportable, IPriceSupportable {
  late final int id;
  late final ProductType type;
  late final String name;
  late final int price;
  late final int count;

  Product.fromList(List<String> fields) {
    this.id = int.parse(fields[0]);
    this.type = ProductType.from(fields[1]);
    this.name = fields[2];
    this.price = int.parse(fields[3]);
    this.count = int.parse(fields[4]);
  }
}

List<Element> applyFilter<T extends Filter, Element>(
    List<Element> items, T filter) {
  return items.where((element) => filter.apply(element)).toList();
}

void showInfo(List<Product> items) {
  items.forEach((element) {
    print(
        "${element.id} ${element.type.name()} ${element.name} ${element.price} рублей ${element.count} шт\n");
  });
}

void main(List<String> arguments) {
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  final lines = articles.split("\n").where((element) => !element.isEmpty);
  final products =
      lines.map((line) => Product.fromList(line.split(","))).toList();
  final filteredByCount = applyFilter(products, CountFilter(53));
  final filteredByPrice = applyFilter(products, PriceFilter(100));
  final filteredByType = applyFilter(
      products, CategoryFilter([ProductType.water, ProductType.bread]));
  print("Сорировка по количеству:\n");
  showInfo(filteredByCount);
  print("Сорировка по цене:\n");
  showInfo(filteredByPrice);
  print("Сорировка по типу:\n");
  showInfo(filteredByType);
}
