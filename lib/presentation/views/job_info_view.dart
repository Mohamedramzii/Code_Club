import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/presentation/views/widgets/job_info_widgets/detailsTab_widgets.dart';
import 'package:job_app/presentation/views/widgets/job_info_widgets/header_widgets.dart';
import 'package:job_app/presentation/views/widgets/job_info_widgets/proposalsTab_widget.dart';

import '../view_model/cubit/app_cubit.dart';

class JobInfoView extends StatefulWidget {
  const JobInfoView({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);
  final AppCubit cubit;
  final int index;

  @override
  State<JobInfoView> createState() => _JobInfoViewState();
}

class _JobInfoViewState extends State<JobInfoView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const HeaderWidgets(),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            SizedBox(
                child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Details',
                ),
                Tab(
                  text: 'Proposals',
                ),
              ],
            )),
            ConstrainedBox(
             constraints: BoxConstraints(
              minHeight: 500.h,
              maxHeight: 750.h
             ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  DetailsTapWidget(cubit: widget.cubit, index: widget.index),
                  ProposalsTap(cubit: widget.cubit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
