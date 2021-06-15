// 앱 활성 사용자 가감 추이
var dataChartActiveUsers = {
    labels: ["5개월전", "4개월전", "3개월전", "2개월전", "1개월전", "현재"],
    datasets: [{
        label: "Android",
        backgroundColor: "rgba(150,190,40,0.4)",
        borderColor: "rgba(150,190,40,1)",
        data: [100, 1000, 1500, 2000, 2100, 3000],
    }, {
        label: "iOS",
        backgroundColor: "rgba(110,110,114,0.4)",
        borderColor: "rgba(110,110,114,1)",
        data: [100, 500, 1000, 2100, 2300, 3500],
    }]
};

// 월별 발송 캠페인 현황
var dataChartMonthSends = {
    labels: ["5개월전", "4개월전", "3개월전", "2개월전", "1개월전", "현재"],
    datasets: [{
        label: "즉시",
        borderColor: "rgba(0, 0, 255, 1)",
        backgroundColor: "rgba(0, 0, 255, .2)",
        data: [20, 50, 100, 150, 100, 150],
    }, {
        label: "예약",
        borderColor: "rgba(0, 255, 0, 1)",
        backgroundColor: "rgba(0, 255, 0, .2)",
        data: [10, 10, 10, 10, 10, 10],
    }, {
        label: "인 앱",
        borderColor: "rgba(0, 255, 255, 1)",
        backgroundColor: "rgba(0, 255, 255, .2)",
        data: [50, 50, 40, 30, 20, 30],
    }, {
        label: "업데이트 알림",
        borderColor: "rgba(255, 0, 0, 1)",
        backgroundColor: "rgba(255, 0, 0, .2)",
        data: [0, 0, 200, 0, 200, 100],
    }]
};

// 시간별 발송 캠페인 현황
var dataChartTimeSends = {
    labels: ["심야", "새벽", "오전", "정오", "오후", "야간"],
    datasets: [{
        data: [
            10,
            30,
            200,
            300,
            200,
            100
        ],
        backgroundColor: [
            "#FF6384",
            "#4BC0C0",
            "#FFCE56",
            "#E7E9ED",
            "#36A2EB",
            "#36A2EB"
        ]
    }]

};

// 앱 링크 유도율 통계
var dataChartReacts = {
    labels: ["5개월전", "4개월전", "3개월전", "2개월전", "1개월전", "현재"],
    datasets: [{
        label: "즉시",
        borderColor: "rgba(0, 0, 255, 1)",
        backgroundColor: "rgba(0, 0, 255, .2)",
        data: [80, 50, 50, 20, 50, 100],
    }, {
        label: "예약",
        borderColor: "rgba(0, 255, 0, 1)",
        backgroundColor: "rgba(0, 255, 0, .2)",
        data: [10, 10, 10, 10, 10, 10],
    }, {
        label: "인 앱",
        borderColor: "rgba(0, 255, 255, 1)",
        backgroundColor: "rgba(0, 255, 255, .2)",
        data: [50, 50, 40, 30, 20, 30],
    }, {
        label: "업데이트 알림",
        borderColor: "rgba(255, 0, 0, 1)",
        backgroundColor: "rgba(255, 0, 0, .2)",
        data: [0, 0, 200, 0, 200, 100],
    }]
};

var _classChart = {
    activeUsers: null, // 앱 활성 사용자
    monthSends: null, // 월별 발송 캠페인 현황
    timeSends: null, // 시간별 발송 캠페인 현황
    reacts: null // 앱 링크 유도율 통계
}

// 차트 jQuery 엘리먼트
var $chart = {
    activeUsers: $("#chartActiveUsers"), // 앱 활성 사용자
    monthSends: $("#chartMonthSends"), // 월별 발송 캠페인 현황
    timeSends: $("#chartTimeSends"), // 시간별 발송 캠페인 현황
    reacts: $("#chartReacts") // 앱 링크 유도율 통계
};

var _setChart = function(_el, _obj, _type, _data) {
    if (_el.length < 1) return false;
    var _element = _el[0].getContext("2d");
    _obj = new Chart(_element, {
        type: _type,
        data: _data
    });
};

// 앱 활성 사용자 가감 추이
var myChartActiveUsers = null;
var myChartMonthSends = null;
var myChartTimeSends = null;
var myChartReacts = null;

// 앱 활성 사용자 가감 추이
_setChart($chart.activeUsers, myChartActiveUsers, 'line', dataChartActiveUsers);

// 월별 발송 캠페인 현황
_setChart($chart.monthSends, myChartMonthSends, 'line', dataChartMonthSends);

// 시간별 발송 캠페인 현황
_setChart($chart.timeSends, myChartTimeSends, 'polarArea', dataChartTimeSends);

// 앱 링크 유도율 통계
_setChart($chart.reacts, myChartReacts, 'bar', dataChartReacts);
