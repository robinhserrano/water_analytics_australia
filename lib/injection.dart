import 'package:get_it/get_it.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/bloc/cloud_sales_details_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/login/bloc/login_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales/bloc/cubit/sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales_details/bloc/sales_details_cubit.dart';

import '2_application/pages/sales/bloc/cubit/sort_filter_cubit.dart';

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl
    ..registerFactory(() => LoginCubit(repo: sl<Repository>()))
    ..registerFactory(
      () => SalesCubit(
        repo: sl<Repository>(),
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => SalesDetailsCubit(
        repo: sl<Repository>(),
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => CloudSalesCubit(
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => CloudSalesDetailsCubit(
        firestoreService: sl(),
      ),
    )
    // ..registerFactory(
    //   () => SortFilterCubit.new,
    // )

// // ! domain Layer
//     ..registerFactory(() => ProductUseCases(productRepo: sl()))
//     ..registerFactory(() => ProductDetailsUseCases(productRepo: sl()))

// // ! data Layer
//     ..registerFactory<ProductRepo>(
//       () => ProductRepoImpl(productRemoteDatasource: sl()),
//     )
//     ..registerFactory<ProductRemoteDatasource>(
//       () => ProductRemoteDatasourceImpl(client: sl()),
//     )
    ..registerFactory<Repository>(() => Repository(client: sl<OdooClient>()))
    ..registerFactory(FirebaseFirestoreService.new)

// ! externs
    ..registerSingleton(OdooClient('https://wateranalytics.odoo.com'));
  // ..registerSingleton(
  //   SortFilterCubit.new, // Factory function to create the cubit
  // );
}
