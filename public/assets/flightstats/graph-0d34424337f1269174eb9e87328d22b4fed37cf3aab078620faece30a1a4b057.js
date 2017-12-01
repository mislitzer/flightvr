jq = jQuery.noConflict();

function loadData() {
    var statsItems = jq("#flightstat-items").data("url");
    prepareChartData(statsItems);
}
//
function prepareChartData(items) {
    var chartItems = [];
    var that = this;
    var value = 0;
    jq.each(items, function(key, item) {
        var inner = [];
        var dateString = item.Month;
        var split = dateString.split(" ");
        var year = split[0];
        var month = that.month(split[1]);
        var fullDate = new Date(year + "-" + month + "-01");
        
        inner.push(fullDate.getTime());
        inner.push(value + item.Value);
        
        chartItems.push(inner);
    });
    
    console.log(chartItems);
    console.log(chartItems.sort());
    buildChart("container", chartItems, "Passengers at London Airports", "Passenger trend (%)");
}

function buildChart(container, data, label, series) {
    Highcharts.chart(container, {
        chart: {
            zoomType: 'x',
            backgroundColor: 'rgba(255, 255, 255, 1.0)',
        },
        credits: {
            enabled: false
        },
        title: {
            text: label
        },
        xAxis: {
            type: 'datetime',
            title: {
                text: 'Time'
            }
        },
        yAxis: {
            title: {
                text: series
            }
        },
        legend: {
            enabled: false
        },
        series: [{
            type: 'column',
            name: series,
            data: data,
            color: '#EC2347',
            borderWidth: 0
        }]
    });
}

function month(slug) {
    var month = 0;
    switch (slug) {
        case 'Jan':
            month = 1;
            break;
            
        case 'Feb':
            month = 2;
            break;
            
        case 'Mar':
            month = 3;
            break;
            
        case 'Apr':
            month = 4;
            break;
            
        case 'May':
            month = 5;
            break;
            
        case 'June':
            month = 6;
            break;
            
        case 'July':
            month = 7;
            break;
            
        case 'Aug':
            month = 8;
            break;
            
        case 'Sept':
            month = 9;
            break;
            
        case 'Oct':
            month = 10;
            break;
            
        case 'Nov':
            month = 11;
            break;
            
        case 'Dec':
            month = 12;
            break;
        
        default:
            month = slug;
    }
    
    return month;
}

if (window.location.href.indexOf("/flightstats") != -1) {
    jq(document).ready(function() {
       loadData();
    });
}
;
