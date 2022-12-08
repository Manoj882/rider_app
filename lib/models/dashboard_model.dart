class DashboardModel {
  String title;
  int value;
  DashboardModel({
    required this.title,
    required this.value,
  });
}

List<DashboardModel> listOfDashboardData = [
  DashboardModel(
    title: 'Total Earnings (Rs.)',
    value: 15000,
  ),
  DashboardModel(
    title: 'Total Fare (Rs.)',
    value: 735,
  ),
  DashboardModel(
    title: 'Request Recieved',
    value: 25,
  ),
  DashboardModel(
    title: 'Request Accepted',
    value: 124,
  ),
];
