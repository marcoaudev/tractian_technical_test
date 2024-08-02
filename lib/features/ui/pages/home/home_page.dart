import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_technical_test/features/ui/pages/home/home_state.dart';
import 'package:tractian_technical_test/features/ui/pages/home/home_store.dart';
import 'package:tractian_technical_test/features/ui/pages/home/components/company_item.dart';
import 'package:tractian_technical_test/features/ui/widgets/custom_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeStore>().fetchCompanies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeStore>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: SizedBox(
          height: 30,
          child: Image.asset('assets/tractian_logo.png'),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: state,
        builder: (context, value, child) {
          if (value is SuccessHomePageState) {
            final companies = value.companies;
            child = ListView.builder(
              itemCount: companies.length,
              itemBuilder: (context, index) {
                return CompanyItem(company: companies[index]);
              },
            );
          }

          if (value is LoadingHomePageState) {
            child = const CustomLoading();
          }

          return child ?? Container();
        },
      ),
    );
  }
}
