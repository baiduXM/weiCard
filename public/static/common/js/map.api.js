/**
 * Created by waypdc on 2017/5/24.
 */
//在指定的容器内创建地图实例
var map = new BMap.Map("container");
map.setDefaultCursor("crosshair");//设置地图默认的鼠标指针样式
map.enableScrollWheelZoom();//启用滚轮放大缩小，默认禁用。
//创建点坐标
var point = new BMap.Point(document.getElementById('lon').value, document.getElementById('lat').value);
//初始化地图，设置中心点坐标和地图级别
map.centerAndZoom(point, 15);
var gc = new BMap.Geocoder();
//NavigationControl 地图平移缩放控件，默认位于地图左上方 它包含控制地图的平移和缩放的功能。
map.addControl(new BMap.NavigationControl());
// 创建标注
var marker = new BMap.Marker(point);
// 将标注添加到地图中
map.addOverlay(marker);
//*****************************单击获取经纬度
map.addEventListener("click", function(e){//地图单击事件
    document.getElementById("lon").value = e.point.lng ;
    document.getElementById("lat").value = e.point.lat;
    map.clearOverlays();//清空原来的标注
    var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // 创建标注，为要查询的地方对应的经纬度
    map.addOverlay(marker);
    //marker的enableDragging方法开启拖拽功能。
    marker.enableDragging();
    //监听标注的dragend事件来捕获拖拽后标注的最新位置
    marker.addEventListener("dragend",function(e){
        gc.getLocation(e.point, function(rs){
            document.getElementById("lon").value = e.point.lng;
            document.getElementById("lat").value = e.point.lat;
        });
    });
});

// 创建标注工具实例
function iploac(result){//根据IP设置地图中心
    var cityName = result.name;
}
var myCity = new BMap.LocalCity();
myCity.get(iploac);
function sear(result){//地图搜索
    var local = new BMap.LocalSearch(map, {
        renderOptions:{map: map}
    });
    local.search(result);
}