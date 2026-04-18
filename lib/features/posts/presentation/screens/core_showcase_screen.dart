// import 'package:clean_arc/core/app_storage/secure_storage_service.dart';
// import 'package:clean_arc/core/constant/app_assets.dart';
// import 'package:clean_arc/core/constant/constants.dart';
// import 'package:clean_arc/core/injection/injection_app.dart';
// import 'package:clean_arc/core/network/network_checker.dart';
// import 'package:clean_arc/core/routes/navigator_push.dart';
// import 'package:clean_arc/core/state/base_state.dart';
// import 'package:clean_arc/core/theme/app_colors.dart';
// import 'package:clean_arc/core/theme/app_colors_extension.dart';
// import 'package:clean_arc/core/widgets/app_dialogs/custom_dialog.dart';
// import 'package:clean_arc/core/widgets/custom_text_feild.dart';
// import 'package:clean_arc/core/widgets/hud_loader.dart';
// import 'package:clean_arc/core/widgets/loader.dart';
// import 'package:clean_arc/features/posts/presentation/bloc/core_showcase_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CoreShowcaseScreen extends StatefulWidget {
//   const CoreShowcaseScreen({Key? key}) : super(key: key);

//   @override
//   State<CoreShowcaseScreen> createState() => _CoreShowcaseScreenState();
// }

// class _CoreShowcaseScreenState extends State<CoreShowcaseScreen> {
//   late final TextEditingController _queryController;

//   @override
//   void initState() {
//     super.initState();
//     _queryController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _queryController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CoreShowcaseCubit(
//         secureStorageService: SecureStorageService(), networkChecker: null,
//         //  networkChecker: getIt<NetworkChecker>(),
//       ),
//       child: BlocConsumer<CoreShowcaseCubit, BaseState<Map<String, dynamic>>>(
//         listener: (context, state) {
//           if (state is DoneState<Map<String, dynamic>>) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.msg ?? 'Done')),
//             );
//           }
//         },
//         builder: (context, state) {
//           final AppColorsExtension? colors =
//               Theme.of(context).extension<AppColorsExtension>();

//           return LoaderHud(
//             isCall: state is LoadingState<Map<String, dynamic>>,
//             child: Scaffold(
//               appBar: AppBar(
//                 title: const Text('Core + Base Showcase'),
//                 actions: [
//                   IconButton(
//                     onPressed: () =>
//                         RouteManager.navigateTo(const CoreDetailScreen()),
//                     icon: const Icon(Icons.arrow_forward_ios),
//                   ),
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Assets sample: ${AppImages.logo}',
//                       style: const TextStyle(fontSize: 12),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Asset helper: ${getAsset('home_banner')}',
//                       style: const TextStyle(fontSize: 12),
//                     ),
//                     const SizedBox(height: 16),
//                     CustomTextField(
//                       upperText: 'Debounced Query',
//                       hint: 'Type to trigger Debouncer',
//                       controller: _queryController,
//                       onChange: (v) => context
//                           .read<CoreShowcaseCubit>()
//                           .onDebouncedQuery(v ?? ''),
//                       errorKey: 'query',
//                       errors: state is ValidateState<Map<String, dynamic>>
//                           ? state.errors
//                           : null,
//                     ),
//                     const SizedBox(height: 16),
//                     Wrap(
//                       spacing: 8,
//                       runSpacing: 8,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitInit(),
//                           child: const Text('Init'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitLoading(),
//                           child: const Text('Loading'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () => context
//                               .read<CoreShowcaseCubit>()
//                               .emitLoadingMore(),
//                           child: const Text('LoadingMore'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitPaginate(),
//                           child: const Text('Paginate'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitEmpty(),
//                           child: const Text('Empty'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitError(),
//                           child: const Text('Error'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitErrorData(),
//                           child: const Text('ErrorData'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitValidate(),
//                           child: const Text('Validate'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().emitDone(),
//                           child: const Text('Done'),
//                         ),
//                         OutlinedButton(
//                           onPressed: () => context
//                               .read<CoreShowcaseCubit>()
//                               .checkConnectivity(),
//                           child: const Text('Check Network'),
//                         ),
//                         OutlinedButton(
//                           onPressed: () => context
//                               .read<CoreShowcaseCubit>()
//                               .saveDemoToken(_queryController.text),
//                           child: const Text('Save Token'),
//                         ),
//                         OutlinedButton(
//                           onPressed: () =>
//                               context.read<CoreShowcaseCubit>().readDemoToken(),
//                           child: const Text('Read Token'),
//                         ),
//                         OutlinedButton(
//                           onPressed: () => context
//                               .read<CoreShowcaseCubit>()
//                               .parseErrorDemo(),
//                           child: const Text('Parse Errors'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             CustomDialog(
//                               dismiss: true,
//                               theDialog: AlertDialog(
//                                 title: const Text('Custom Dialog'),
//                                 content: const Text(
//                                     'Opened using core/widgets/app_dialogs/custom_dialog.dart'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () => RouteManager.pop(),
//                                     child: const Text('Close'),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                           child: const Text('Open CustomDialog'),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     if (state is LoadingMoreState<Map<String, dynamic>>)
//                       ColorLoader(),
//                     _StateCard(state: state, colors: colors),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class _StateCard extends StatelessWidget {
//   const _StateCard({required this.state, required this.colors});

//   final BaseState<Map<String, dynamic>> state;
//   final AppColorsExtension? colors;

//   @override
//   Widget build(BuildContext context) {
//     String title = 'InitState';
//     String message = 'No action yet';

//     if (state is SuccessState<Map<String, dynamic>>) {
//       title = 'SuccessState';
//       message = (state as SuccessState<Map<String, dynamic>>).data.toString();
//     } else if (state is ErrorState<Map<String, dynamic>>) {
//       title = 'ErrorState';
//       message = (state as ErrorState<Map<String, dynamic>>).msg ?? '';
//     } else if (state is ErrorDataState<Map<String, dynamic>>) {
//       title = 'ErrorDataState';
//       message = (state as ErrorDataState<Map<String, dynamic>>).msg ?? '';
//     } else if (state is OfflineState<Map<String, dynamic>>) {
//       title = 'OfflineState';
//       message = (state as OfflineState<Map<String, dynamic>>).msg ?? '';
//     } else if (state is ValidateState<Map<String, dynamic>>) {
//       title = 'ValidateState';
//       message =
//           (state as ValidateState<Map<String, dynamic>>).errors.toString();
//     } else if (state is DoneState<Map<String, dynamic>>) {
//       title = 'DoneState';
//       message = (state as DoneState<Map<String, dynamic>>).msg ?? '';
//     } else if (state is PaginateState<Map<String, dynamic>>) {
//       title = 'PaginateState';
//       message = 'Pagination trigger emitted';
//     } else if (state is EmptyState<Map<String, dynamic>>) {
//       title = 'EmptyState';
//       message = 'No data available';
//     } else if (state is LoadingState<Map<String, dynamic>>) {
//       title = 'LoadingState';
//       message = 'Loading...';
//     } else if (state is LoadingMoreState<Map<String, dynamic>>) {
//       title = 'LoadingMoreState';
//       message = 'Loading more...';
//     }

//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: colors?.cardBackground ?? AppColors.lightBlack,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               color: colors?.chatText ?? AppColors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             message,
//             style: TextStyle(
//               color: AppColors.white,
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CoreDetailScreen extends StatelessWidget {
//   const CoreDetailScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Core Detail Screen'),
//         leading: IconButton(
//           onPressed: () => RouteManager.pop(),
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//       ),
//       body: const Center(
//         child: Text('Navigation done using RouteManager.navigateTo / pop'),
//       ),
//     );
//   }
// }
