
let all_goods = [
    // {"spID":1,"sID":"jerry","name":"广东酸辣粉","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼好吃，狠辣","category":"华南","price":20.8,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]},
    // {"spID":2,"sID":"jerry","name":"广东酸辣粉2","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","price":2122.0,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]},
    // {"spID":2,"sID":"jerry","name":"广东酸辣粉2","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","price":2122.0,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]},
    // {"spID":2,"sID":"jerry","name":"广东酸辣粉2","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","price":2122.0,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]},
    // {"spID":2,"sID":"jerry","name":"广东酸辣粉2","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","price":2122.0,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]},
    // {"spID":2,"sID":"jerry","name":"广东酸辣粉2","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","price":2122.0,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]},
    // {"spID":2,"sID":"jerry","name":"广东酸辣粉2","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","price":2122.0,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]}
];

let order_list = [
    // {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"未发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
    // {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"未发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
    // {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"未发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
    // {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
    // {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
    // {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
    // {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"}

];
function categoryConvert(Chinese){
    if (Chinese==='西南')
        return 'xinan';
    else if(Chinese==='华南')
        return 'huanan';
    else if (Chinese==='华东')
        return 'huadong';
    else if(Chinese==='东北')
        return 'dongbei';
    else if(Chinese==='中原')
        return 'zhongyuan';
}

function categoryConvertR(English){
    if (English==='xinan')
        return '西南';
    else if(English==='huanan')
        return '华南';
    else if (English==='huadong')
        return '华东';
    else if(English==='dongbei')
        return '东北';
    else if(English==='zhongyuan')
        return '中原';
}



function addSp(button) {
    // console.log(cur_info_pic_url);
    let new_sp_name = $('#AddSpName').val();
    let new_sp_stock = $('#AddRemainStocks').val();
    let new_sp_price = $('#AddPrice').val();
    let new_sp_category =$("#AddCategory option:selected").val();
    let new_sp_info = $('#Addinfo').val();
    $.ajax({
        url : "http://127.0.0.1:8080/createSpecialty",
        type : 'POST',
        dataType : 'json',
        crossOrigin: true,
        data: {"name":new_sp_name,
               "picUrls":cur_info_pic_url.toString(),
               "stock":new_sp_stock,
               "detail":new_sp_info,
               "category":categoryConvertR(new_sp_category),
               "price":new_sp_price},
        success: function (data) {
            console.log(JSON.stringify(data));
            if(data.result==="true"){
                $('#AddSuccess').toast('show');
                $('#collapseAddSp').collapse('toggle');
                setTimeout("refresh_page()",3000);
            }
            else{
                $('#collapseAddSp').modal('hide');
                $('#SomeFail').toast('show');
            }


        }
    });

}

function refresh_page() {
    location.reload();
}
function changeThumb() {
    let index = $('#ChangeThumb').attr('index');
    let sp_id = all_goods[index].spID;
    let changed_sp_thumb_url = cur_info_pic_url[0];
    $.ajax({
        url:"http://127.0.0.1:8080/updateSpecialtyPic",
        type : 'POST',
        dataType : 'json',
        crossOrigin: true,
        data:{
            "spID":sp_id,
            "picUrl":changed_sp_thumb_url,
        },
        success: function (data) {
            console.log(JSON.stringify(data));
            if(data.result==="true"){
                $('#ChangeBasicInfoSuccess').toast('show');
                $('#ChangeThumb').modal('hide');
                $(".card[data-goodindex=\'"+index+"\'] img").attr("src",changed_sp_thumb_url);
                all_goods[index].picUrl = changed_sp_thumb_url;
            }
            else{
                $('#SomeFail').toast('show');
                $('#ChangeThumb').modal('hide');
            }


        }
    });
}
function changeBasicInfo() {
    let index = $('#ChangeBasicInfo').attr('index');
    let sp_id = all_goods[index].spID;
    let changed_sp_name = $('#GoodName').val();
    let changed_sp_stock = $('#RemainStocks').val();
    let changed_sp_price = $('#price').val();
    let changed_sp_category = $('#category option:selected').val();
    $.ajax({
        url:"http://127.0.0.1:8080/updateSpecialtyInfo",
        type : 'POST',
        dataType : 'json',
        crossOrigin: true,
        data:{
            "spID":sp_id,
            "name":changed_sp_name,
            "stock":changed_sp_stock,
            "category":categoryConvertR(changed_sp_category),
            "price":changed_sp_price
        },
        success: function (data) {
            console.log(JSON.stringify(data));
            if(data.result==="true"){
                $('#ChangeBasicInfoSuccess').toast('show');
                $('#ChangeBasicInfo').modal('hide');
                // console.log( $(".card[data-goodindex=\'"+index+"\']  [data-target='price']").val());
                $(".card[data-goodindex=\'"+index+"\']  [data-target='spName']").text(changed_sp_name);
                $(".card[data-goodindex=\'"+index+"\']  [data-target='remainStocks']").text(changed_sp_stock);
                $(".card[data-goodindex=\'"+index+"\']  [data-target='category']").text(categoryConvertR(changed_sp_category));
                $(".card[data-goodindex=\'"+index+"\']  [data-target='price']").text("￥"+changed_sp_price);

                all_goods[index].spName = changed_sp_name;
                all_goods[index].stock = changed_sp_stock;
                all_goods[index].price = changed_sp_price;
                all_goods[index].category = categoryConvertR(changed_sp_category);
            }
            else
            {
                $('#SomeFail').toast('show');
                $('#ChangeBasicInfo').modal('hide');
            }

        }
    });
}
function changeInfo() {
    let index = $('#ChangeDetails').attr('index');
    let sp_id = all_goods[index].spID;
    let changed_info_picurls_subarr = cur_info_pic_url.slice(1);
    let changed_info_text = $('#spInfoText').val();
    $.ajax({
        url : "http://127.0.0.1:8080/updateSpecialtyDetail",
        type : 'POST',
        dataType : 'json',
        crossOrigin: true,
        data: {"spID":sp_id,
               "picUrls":changed_info_picurls_subarr.toString(),
               "detail":changed_info_text,
              },
        success: function (data) {
            console.log(JSON.stringify(data));
            if(data.result==="false"){
                $('#AddSuccess').toast('show');
                $('#ChangeDetails').modal('hide');
            }else{
                $('#SomeFail').toast('show');
                $('#ChangeDetails').modal('hide');
            }


        }
    });

}
function deleteSp() {
    let index = $('#DeleteSp').attr('index');
    let sp_id = all_goods[index].spID;
    $.ajax({
        url : "http://127.0.0.1:8080/deleteSpecialty/"+sp_id,
        type : 'GET',
        dataType : 'json',
        crossOrigin: true,
        success: function (data) {
            console.log(JSON.stringify(data));
            if(data.result==="true"){
                $('.card[data-goodindex=\''+index+'\']').remove();
                $('#DeleteSp').modal('hide');
                $('#DeleteSuccess').toast('show');
            }
            else
            {
                $('#DeleteSp').modal('hide');
                $('#SomeFail').toast('show');
            }
        }
    });
}
function returnShipDiv(number){
    if (order_list[number].state==='已发货')
        return '  <button class="btn btn-primary btn-info" type="button" data-toggle="collapse" data-target="#Ship'+number+'" aria-expanded="false" aria-controls="collapseExample" >\n' +
            '状态:已发货\n' +
            '</button>'+
            '  <div class="collapse my-3" id="Ship'+number+'">\n' +
            '                                    <div class="card card-body">\n' +
            '                                            <div class="form-group shipDiv" >\n' +
            '                                                <label for="exampleFormControlInput1">发货订单编号</label>\n' +
            '                                                <input type="email" class="form-control Expressno" id="exampleFormControlInput1" placeholder="FXS903123FAA" disabled value="'+order_list[number].expressNo+'">\n' +
            '                                            </div>\n' +
            '                                    </div>\n' +
            '                                </div>\n';
    else if(order_list[number].state==='已收货，待评价')
        return '  <button class="btn btn-primary btn-info" type="button" data-toggle="collapse" data-target="#Ship'+number+'" aria-expanded="false" aria-controls="collapseExample" >\n' +
            '状态:已收货\n' +
            '</button>'+
            '  <div class="collapse my-3" id="Ship'+number+'">\n' +
            '                                    <div class="card card-body">\n' +
            '                                            <div class="form-group shipDiv" >\n' +
            '                                                <label for="exampleFormControlInput1">发货订单编号</label>\n' +
            '                                                <input type="email" class="form-control Expressno" id="exampleFormControlInput1" placeholder="FXS903123FAA" disabled value="'+order_list[number].expressNo+'">\n' +
            '                                            </div>\n' +
            '                                    </div>\n' +
            '                                </div>\n';
    else if(order_list[number].state==='已完成')
        return '  <button class="btn btn-primary btn-info" type="button" data-toggle="collapse" data-target="#Ship'+number+'" aria-expanded="false" aria-controls="collapseExample" >\n' +
            '状态:已完成\n' +
            '</button>'+
            '  <div class="collapse my-3" id="Ship'+number+'">\n' +
            '                                    <div class="card card-body">\n' +
            '                                            <div class="form-group shipDiv" >\n' +
            '                                                <label for="exampleFormControlInput1">发货订单编号</label>\n' +
            '                                                <input type="email" class="form-control Expressno" id="exampleFormControlInput1" placeholder="FXS903123FAA" disabled value="'+order_list[number].expressNo+'">\n' +
            '                                            </div>\n' +
            '                                    </div>\n' +
            '                                </div>\n';
    else
        return'                                <button class="btn btn-primary btn-info" type="button" data-toggle="collapse" data-target="#Ship'+number+'"  aria-expanded="false" aria-controls="collapseExample">\n' +
            '                                    发货\n' +
            '                                </button>\n' +
            '                                <div class="collapse my-3" id="Ship'+number+'">\n' +
            '                                    <div class="card card-body">\n' +
            '                                        <form>\n' +
            '                                            <div class="form-group shipDiv" >\n' +
            '                                                <label for="exampleFormControlInput1">发货订单编号</label>\n' +
            '                                                <input type="email" class="form-control Expressno" id="exampleFormControlInput1" placeholder="FXS903123FAA">\n' +
            '                                            </div>\n' +
            '                                            <button type="button" class="btn btn-primary" onclick="ShipOperate(this,'+number+')">Submit</button>\n' +
            '                                        </form>\n' +
            '                                    </div>\n' +
            '                                </div>\n' ;
}

function returnExpress(express_no) {
    return    '                            <div class="card card-body">\n' +
        '                                            <div class="form-group shipDiv" >\n' +
        '                                                <label for="exampleFormControlInput1">发货订单编号</label>\n' +
        '                                                <input type="email" class="form-control Expressno"  placeholder="FXS903123FAA" disabled value="'+express_no+'">\n' +
        '                                            </div>\n' +
        '                                    </div>\n' ;

}
function ShipOperate(buttonNode,number){
    let  express_no = $(buttonNode).siblings().find(".Expressno").val();
    $.ajax({
        url : "http://127.0.0.1:8080/setOrderStateSent",
        type : 'POST',
        dataType : 'json',
        crossOrigin: true,
        data: {"oID":order_list[number].oID,"expressNo":express_no},
        success: function (data) {
            console.log(JSON.stringify(data));
            if(data.result==="true"){
                console.log("修改状态成功");
                order_list[number].expressNo = express_no;
                $('#Ship'+number).empty();
                $('#Ship'+number).append(returnExpress(express_no));
                $('#Ship'+number).prev().text("状态:已发货");
            }else{
                alert("修改状态失败");
            }
        }
    });
}

function page_init(){
    load_all_goods();
    load_all_order();

    $('#DeleteSp').on('show.bs.modal', function (event) {
        //  console.log("sdasd");
        let button = $(event.relatedTarget);// Button that triggered the modal
        let number = button.data('whatever');// Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        let modal = $(this);
        modal.find('.spIDinDelete').text('商品ID:' + all_goods[number]['spID']);
        modal.find('.spNameinDelete').text('商品名称:'+all_goods[number]['name']);
        modal.find('.imgInDeleteModal').attr("src",all_goods[number]['picUrl']);
        modal.attr("index",number);

    });

    $('#ChangeBasicInfo').on('show.bs.modal',function(event){
        let button = $(event.relatedTarget);
        let number = button.data('whatever');
        let modal = $(this);
        modal.find('#GoodName').val(all_goods[number]['name']);
        modal.find('#RemainStocks').val(all_goods[number]['stock']);
        modal.find('#price').val(all_goods[number]['price']);
        modal.attr("index",number);
        // modal.find('#category').find('option[text=\''+categoryConvert(all_goods[number]['category'])+'\']').attr("selected",true);
    });

    $('#ChangeThumb').on('show.bs.modal',function (event) {
        let button = $(event.relatedTarget);
        let number = button.data('whatever');
        let modal = $(this);
        modal.attr('index',number);
    });

    $('#ChangeDetails').on('show.bs.modal',function (event) {
        let button = $(event.relatedTarget);
        let number = button.data('whatever');
        let modal = $(this);
        modal.attr('index',number);
    });


}

$(document).ready(function () {

    $.ajax({
        url : "http://127.0.0.1:8080/getCurrentUserInfo",
        type : 'GET',
        dataType : 'json',
        crossOrigin: true,
        success: function (data) {
            console.log(JSON.stringify(data));
            if (data.result === "false") {
                window.location.href = "./login.html";
            }
            else if (data.category === "customer"){
                window.location.href = "./home.html";
            }
        }
    });

    $.ajax({
        url : "http://127.0.0.1:8080/getSellerSpecialtyList",
        type : 'GET',
        dataType : 'json',
        crossOrigin: true,
        success: function (data) {
            console.log(JSON.stringify(data));
            if (data.result === "true") {
                all_goods = data.data;
                $.ajax({
                    url : "http://127.0.0.1:8080/currentSellerOrderList",
                    type : 'GET',
                    dataType : 'json',
                    crossOrigin: true,
                    success: function (data) {
                        console.log(JSON.stringify(data));
                        if (data.result === "true") {
                            order_list = data.data;
                            page_init();
                        }
                    }
                });
            }

        }
    });



});

function load_all_goods()
{
    let PanelListNode = $("#PanelList");
    for(let i=0;i<all_goods.length;i++){
        let panel = $(' <div class="card card-float my-5" data-goodindex="'+i+'">\n' +
            '                <div class="card-header">\n' +
            '                    <h5 class="mb-0">\n' +
                                     all_goods[i]["name"] +
            '                    </h5>\n' +
            '                </div>\n' +
            '                <div class="card-body">\n' +
            '                        <div class="media">\n' +
            '                            <img src="'+ all_goods[i]["picUrl"]+'"  class="align-self-center mr-3" alt="..." style="width:20%">\n' +
            '                            <div class="media-body">\n' +
            '                                <h5 class="mt-0">'+all_goods[i]["name"]+'</h5>\n' +
            '                                <div class="bd-callout bd-callout-warning">\n' +
            '                                        <dl class="row">\n' +
            '                                            <dt class="col-sm-3">商品ID</dt>\n' +
            '                                            <dd class="col-sm-9" data-target="spID">'+ all_goods[i]["spID"]+'</dd>\n' +
            '\n' +
            '                                            <dt class="col-sm-3">商品名称</dt>\n' +
            '                                            <dd class="col-sm-9" data-target="spName">'+ all_goods[i]["name"]+'</dd>\n' +
            '\n' +
            '                                            <dt class="col-sm-3">剩余库存</dt>\n' +
            '                                            <dd class="col-sm-9" data-target="remainStocks">'+  all_goods[i]["stock"]+'<span>(单位：件)</span></dd>\n' +
            '\n' +
            '                                            <dt class="col-sm-3 text-truncate">地域分类</dt>\n' +
            '                                            <dd class="col-sm-9" data-target="category">'+ all_goods[i]["category"]+'</dd>\n' +
            '\n' +
            '                                            <dt class="col-sm-3 text-truncate">价格</dt>\n' +
            '                                            <dd class="col-sm-9" data-target="price">￥'+ all_goods[i]["price"]+'</dd>\n' +
            '                                            <dt class="col-sm-3 text-truncate">销量</dt>\n' +
            '                                            <dd class="col-sm-9" data-target="salesVolume">'+ all_goods[i]["salesVolume"]+'</dd>\n' +
            '\n' +
            '                                            <dt class="col-sm-3 text-truncate">商品评分</dt>\n' +
            '                                            <dd class="col-sm-9">\n' +
            '                                                <p>\n' +
                                                                        generateStar(all_goods[i].star)+
            '                                                </p>\n' +
            '                                            </dd>\n' +
            '                                        </dl>\n' +
            '                                </div>\n' +
            '                                <div class="ml-auto" role="group" aria-label="Basic example">\n' +
            '                                    <button type="button" class="btn btn-info"  data-toggle="modal" data-target="#ChangeBasicInfo" data-whatever="'+i+'">修改基础信息</button>\n' +
            '                                    <button type="button" class="btn btn-info"  data-toggle="modal" data-target="#ChangeDetails" data-whatever="'+i+'">修改特产详情</button>\n' +
            '                                    <button type="button" class="btn btn-info"  data-toggle="modal" data-target="#ChangeThumb" data-whatever="'+i+'">修改特产预览图</button>\n' +
            '                                    <button type="button" class="btn btn-warning">查看评价</button>\n' +
            '                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#DeleteSp" data-whatever="'+i+'">删除商品</button>\n' +
            '                                </div>\n' +
            '                            </div>\n' +
            '\n' +
            '                        </div>\n' +
            '                    </div>\n' +
            '            </div>');


        PanelListNode.append(panel);
    }
}

function load_all_order() {
    let PanelList2Node = $("#PanelList2");
    for(let i=0;i<order_list.length;i++){
        let panel = $(' <div class="card card-float  my-5">\n' +
            '                <div class="card-header">\n' +
            '                    <span class="text-left"><span class="mb-0">订单编号:</span><span><strong>'+order_list[i]['oID']+'</strong></span></span>\n' +
            '                    <span class="mx-5"><span class="mb-0  ml-auto">成交时间:</span><span><strong>'+order_list[i]['submitTime']+'</strong></span></span>\n' +
            '                </div>\n' +
            '                <div class="card-body">\n' +
            '                    <div class="media">\n' +
            '                        <img src="'+order_list[i].picUrl+'" class="align-self-center mr-3" alt="..." style="width:20%">\n' +
            '                        <div class="media-body">\n' +
            '                            <div class="media-body">\n' +
            '                                <h5 class="mt-0">'+order_list[i]['oID']+'</h5>\n' +
            '                                <div class="bd-callout bd-callout-warning">\n' +
            '                                    <h5>商品信息</h5>\n' +
            '                                    <dl class="row">\n' +
            '                                        <dt class="col-2">商品ID</dt>\n' +
            '                                        <dd class="col-4">'+order_list[i]['spID']+'</dd>\n' +
            '\n' +
            '                                        <dt class="col-2">商品名称</dt>\n' +
            '                                        <dd class="col-4">'+order_list[i]['spName']+'</dd>\n' +
            '\n' +
            '                                        <dt class="col-2">成交价格</dt>\n' +
            '                                        <dd class="col-4">￥'+order_list[i]['sum']+'</dd>\n' +
            '\n' +
            '                                        <dt class="col-2">成交数量</dt>\n' +
            '                                        <dd class="col-4">'+order_list[i]['count']+'</dd>\n' +
            '                                    </dl>\n' +
            '                                </div>\n' +
            '                                <div class="bd-callout bd-callout-warning">\n' +
            '                                    <h5>买家信息</h5>\n' +
            '                                    <dl class="row">\n' +
            '                                        <dt class="col-2">买家ID</dt>\n' +
            '                                        <dd class="col-4">'+order_list[i]['cID']+'</dd>\n' +
            '\n' +
            '                                        <dt class="col-2">买家姓名</dt>\n' +
            '                                        <dd class="col-4">'+order_list[i]['cName']+'</dd>\n' +
            '\n' +
            '                                        <dt class="col-2">收货地址</dt>\n' +
            '                                        <dd class="col-4">'+order_list[i]['recvAddress']+'</dd>\n' +
            '\n' +
            '                                        <dt class="col-2">收货人电话</dt>\n' +
            '                                        <dd class="col-4">'+order_list[i]['cPhone']+'</dd>\n' +
            '                                    </dl>\n' +
            '                                </div>\n' +
                                            returnShipDiv(i)+
            '                            </div>\n' +
            '\n' +
            '\n' +
            '\n' +
            '                        </div>\n' +
            '                    </div>\n' +
            '\n' +
            '                </div>\n' +
            '            \n' +
            '            </div>');

        PanelList2Node.append(panel);
    }
}

function generateStar(num)  {
    let star = "";
    if(num>5){
       for(let i=0;i<5;i++)
           star = star + returnGoodStar();
    }else if(num<=0){
        for(let i=0;i<num;i++)
            star = star + returnBadStar();
    }
    else {
        let i;
        for( i=0;i<num;i++)
            star = star+returnGoodStar();
        for(;i<5;i++)
            star = star+returnBadStar();
    }

}
function returnGoodStar(){
    return ' <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill-rule="evenodd" d="M12.672.668a.75.75 0 00-1.345 0L8.27 6.865l-6.838.994a.75.75 0 00-.416 1.279l4.948 4.823-1.168 6.811a.75.75 0 001.088.791L12 18.347l6.117 3.216a.75.75 0 001.088-.79l-1.168-6.812 4.948-4.823a.75.75 0 00-.416-1.28l-6.838-.993L12.672.668z"></path></svg> ';
}
function returnBadStar(){
    return  '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill-rule="evenodd" d="M12 .25a.75.75 0 01.673.418l3.058 6.197 6.839.994a.75.75 0 01.415 1.279l-4.948 4.823 1.168 6.811a.75.75 0 01-1.088.791L12 18.347l-6.117 3.216a.75.75 0 01-1.088-.79l1.168-6.812-4.948-4.823a.75.75 0 01.416-1.28l6.838-.993L11.328.668A.75.75 0 0112 .25zm0 2.445L9.44 7.882a.75.75 0 01-.565.41l-5.725.832 4.143 4.038a.75.75 0 01.215.664l-.978 5.702 5.121-2.692a.75.75 0 01.698 0l5.12 2.692-.977-5.702a.75.75 0 01.215-.664l4.143-4.038-5.725-.831a.75.75 0 01-.565-.41L12 2.694z"></path></svg>\n';

}
