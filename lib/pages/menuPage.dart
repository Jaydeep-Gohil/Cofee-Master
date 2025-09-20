import 'package:coffee_master/datamanager.dart';
import 'package:flutter/material.dart';

import 'datamodel.dart';

class menuPage extends StatelessWidget {
  final DataManager dataManager;
  const menuPage({super.key,required this.dataManager});


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: dataManager.getMenu(), builder: ((context,snapshot){
      if(snapshot.hasData){
        var categories = snapshot.data as List<Category>;
        return ListView.builder(
            itemCount: categories.length,
            itemBuilder: ((context,index){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categories[index].name),
              ),
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: categories[index].products.length,
                    itemBuilder: (context,proIndex){
                    var product = categories[index].products[proIndex];
                      return ProductItem(product: product,onAdd: (addedProduct){
                        dataManager.cartAdd(addedProduct);
                      },);
                    },),
              )
            ],
            
          );
        }));
      }else{
        if(snapshot.hasError){
          return Text("there Was an Error");
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      }
    }),
    );
  }
}


class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(product.imageUrl, height: 150, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // Product details (name + price)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "\$ ${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // Add button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () => onAdd(product),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


