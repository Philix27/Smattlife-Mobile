import 'package:smattlife/api/products.dart';
import 'package:smattlife/models/product.dart';

class ProductsDb {
  static DrugsApi notesAPI = DrugsApi();

  static Future<List<Product>> getAllBrands() async {
    List<Product> _notes = [];
    try {
      var listOfMaps = await notesAPI.getAllProducts();
      for (var i in listOfMaps) {
        _notes.add(Product.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _notes;
  }
}
