import 'package:cached_network_image/cached_network_image.dart';
import 'package:smattlife/view/home/product_details.dart';
import 'package:smattlife/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:smattlife/controller/products.dart';
import 'package:smattlife/core/theme/styles.dart';
import 'package:smattlife/models/product.dart';
import 'package:smattlife/view/widgets/loading.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Orders",
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ProductsDb.getAllBrands(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return Loading.spinKitThreeBounce();
          } else if (snapshot.data!.isEmpty) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product b = snapshot.data![index];
                    return buildDrugTile(context, b);
                  }),
            );
          }
        },
      ),
    );
  }
}

Widget buildDrugTile(BuildContext context, Product b) => Column(
      children: [
        ListTile(
          onTap: () {
            MyWidgets.goTo(ProductDetailsPage(product: b));
          },
          tileColor: Styles.cardColor,
          leading: SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: b.img[0].isEmpty ? "" : b.img[0],
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: Styles.primaryColor),
                errorWidget: (context, url, error) => Container(),
              ),
            ),
          ),
          title: Text(
            b.name,
            style: Styles.headlineText2,
          ),
          subtitle: Text(
            b.category,
            style: Styles.bodyText2!.copyWith(fontSize: 10),
          ),
          trailing: Text(
            b.dosageForm,
            style: Styles.bodyText2!.copyWith(fontSize: 10),
          ),
        ),
        Divider(
          color: Styles.backgroundColor,
          height: 2,
        ),
      ],
    );
