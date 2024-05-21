export let menuData = [
  {
    headTitle: "TOP",
  },
  {
    path: '/client',
    title: "ダッシュボード",
    type: "link",
    icon: "ti-dashboard",
    active: true,
    defaultActive: false,
  },
  {
    headTitle: "基本メニュー",
  },
  {
    title: "顧客管理",
    icon: "ti-user",
    type: "sub",
    active: false,
    defaultActive: false,
    children: [
      {
        path: '/client/users',
        title: "顧客一覧",
        type: "link",
        active: false,
        defaultActive: false,
      },
      {
        path: `/client/ranks`,
        title: "ランク一覧",
        type: "link",
        active: false,
        defaultActive: false,
      },
    ],
  },
];


