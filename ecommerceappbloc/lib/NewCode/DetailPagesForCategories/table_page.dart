import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TablePage extends StatelessWidget {
  final List<TableModel> tableModel = TableModel.TableList();
  TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tables', style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0x10101014),
                  borderRadius: BorderRadius.all(
                      Radius.circular(25.r)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(tableModel[index].title,
                          style: TextStyle(
                              color: const Color(0xff424242),
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp
                          ),
                        ),
                        Text('${tableModel[index].discount.toString()} % Off',
                          style: TextStyle(
                              color: const Color(0xff424242),
                              fontWeight: FontWeight.bold,
                              fontSize: 32.sp
                          ),
                        ),
                        Text('Price: ${tableModel[index].price.toString()}',
                          style: TextStyle(
                              color: const Color(0xff424242),
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp
                          ),
                        ),
                        Text('Sold: ${tableModel[index].sold.toString()}',
                          style: TextStyle(
                              color: const Color(0xff424242),
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 130.h,
                        width: 160.w,
                        child: Image.asset(tableModel[index].icon),
                      ),
                      TextButton(onPressed: (){}, child: const Text('View more..', style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),))
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (_, index) => SizedBox(height: 5.h,),
            itemCount: tableModel.length
        ),
      )
    );
  }
}
