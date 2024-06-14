import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users/cloud_sales_details/bloc/admin_users_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/bloc/admin_users_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_detail_page/bloc/aws_sales_details_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/bloc/aws_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/bloc/cloud_sales_details_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/create_users_page/bloc/create_users_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/cubit/landing_price_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/cubit/landing_price_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/login/bloc/login_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales/bloc/cubit/sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales_details/bloc/sales_details_cubit.dart';

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl
    ..registerFactory(
      () => LoginCubit(
        odooRepo: sl<OdooRepository>(),
        repo: sl<Repository>(),
      ),
    )
    ..registerFactory(
      () => SalesCubit(
        odooRepo: sl<OdooRepository>(),
        firestoreService: sl(),
        repo: sl<Repository>(),
      ),
    )
    ..registerFactory(
      () => SalesDetailsCubit(
        odooRepo: sl<OdooRepository>(),
        firestoreService: sl(),
        repo: sl<Repository>(),
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
    ..registerFactory(
      () => LandingPriceCubit(
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => LandingPriceDetailCubit(
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => AdminUsersCubit(
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => AdminUsersDetailCubit(
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => CreateUsersCubit(
        firestoreService: sl(),
      ),
    )
    ..registerFactory(
      () => AwsSalesCubit(
        odooRepo: sl<OdooRepository>(),
        firestoreService: sl(),
        repo: sl<Repository>(),
      ),
    )
    ..registerFactory(
      () => AwsSalesDetailsCubit(
        odooRepo: sl<OdooRepository>(),
        firestoreService: sl(),
        repo: sl<Repository>(),
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
    ..registerFactory<Repository>(
      () => Repository(client: sl()),
    )
    ..registerFactory<OdooRepository>(
      () => OdooRepository(client: sl<OdooClient>()),
    )
    ..registerFactory(FirebaseFirestoreService.new)

// ! externs
    ..registerFactory(Dio.new)
    ..registerSingleton(OdooClient('https://wateranalytics.odoo.com'));

  // ..registerSingleton(
  //   SortFilterCubit.new, // Factory function to create the cubit
  // );
}
