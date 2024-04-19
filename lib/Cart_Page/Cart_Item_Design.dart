import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';

 class Cart_Item_Design extends StatefulWidget {
  Cart_Item_Design({super.key, required this.cart_model,required this.ondelete});
  Cart_Model cart_model;
  Function() ondelete;

  @override
  State<Cart_Item_Design> createState() => _Cart_Item_DesignState();
}

class _Cart_Item_DesignState extends State<Cart_Item_Design> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: DeviceDimenssions.deviceWidth * .6,
        height: DeviceDimenssions.deviceHeight * .16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow:const[
            BoxShadow(
              color: Color.fromARGB(255, 205, 205, 205),
              blurRadius: 8.0,
              spreadRadius: 4.0,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.cart_model.image,
                width: DeviceDimenssions.deviceWidth * .2, // corrected spelling
                height: DeviceDimenssions.deviceHeight * .12,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.cart_model.Name!,
                    style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  SizedBox(
                    width: DeviceDimenssions.deviceWidth * .5,
                    child: Text(widget.cart_model.description!,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text (
                    "${widget.cart_model.price!}\$", // added dollar sign
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: GestureDetector(
                    onTap: widget.ondelete,
                    
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.red),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Icon(
                          Icons.clear_sharp,
                          color: Colors.red,
                          size: 14,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: DeviceDimenssions.deviceWidth * 0.18,
                    height: DeviceDimenssions.deviceHeight * 0.03,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 232, 186, 202),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                          const Text("1"),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child:const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 14,
                                )),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
