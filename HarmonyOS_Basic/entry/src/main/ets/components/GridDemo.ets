@Component
@Preview
export  struct GridDemo {
  @State assignments: Assignment[] = [
    { title: '数学作业', deadline: '2025-09-15', status: 'pending' },
    { title: 'Java编程', deadline: '2025-09-16', status: 'completed' },
    { title: '英语作文', deadline: '2025-09-17', status: 'pending' },
    { title: '物理实验', deadline: '2025-09-18', status: 'overdue' },
    { title: '化学报告', deadline: '2025-09-19', status: 'pending' },
    { title: '历史论文', deadline: '2025-09-20', status: 'completed' }
  ];
  build() {
    Grid(){
      ForEach(this.assignments,(assignments:Assignment)=>{
        GridItem(){
          Column({ space: 20}){
            //作业标题
            Text(assignments.title).fontSize(26)
            //作业状态
            Text(this.getIconByStatus(assignments.status)).fontSize(24)
            Text(assignments.status).fontColor(this.getColorByStatus(assignments.status)).fontSize(24)
            //截止时间
            Text(assignments.deadline).fontSize(12)
          }
        }
      })
    }.columnsTemplate('1fr 1fr')
    .rowsTemplate('auto auto auto')
    .columnsGap(16)
    .rowsGap(16)
    .width('100%')
    .height(500)
    .padding(16)
  }

  getIconByStatus(status: string): string{
    switch (status){
      case 'completed':
        return '✅'; // 已完成
      case 'pending':
        return '📝'; // 待完成
      case 'overdue':
        return '⚠️'; // 已逾期
      default:
        return '📋';
    }
  }
  getColorByStatus(status: string): string{
    switch (status){
      case 'completed':
        return '#ff65ff02'; // 已完成
      case 'pending':
        return '#fff88d1a'; // 待完成
      case 'overdue':
        return '#fffd0c0c'; // 已逾期
      default:
        return '#ffb1afaf';
    }
  }
}

interface Assignment {
  title: string;
  deadline: string;
  status:
    'pending' | 'completed' | 'overdue'
}
