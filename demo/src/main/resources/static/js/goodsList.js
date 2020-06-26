
function logout() {
    console.log("click");
    $.ajax({
        url: "http://127.0.0.1:8080/logout",
        type: "GET",
        dataType: 'json',
        crossOrigin: true,
        success: function (data) {
            console.log(JSON.stringify(data));
            if (data.result === 'true') {
                window.location.href = "./login.html";
            }
        },
        error: function (data) {
            console.log(data)
        }
    })
}

function get_goods_list() {
    var storage = window.localStorage;
    var urlpattern = storage.getItem("urlpattern");
    var keyword = storage.getItem("keyword");
    var url = "http://127.0.0.1:8080" + urlpattern + keyword;
    console.log(url);

    $.ajax({
        url : url,
        type : 'GET',
        dataType : 'json',
        crossOrigin: true,
        success: function (data) {
            console.log(JSON.stringify(data));
            selectGoods = data["data"];
            assert_pageNum_and_load_pagination();
            load_goods_div(0);
        }
    });

}
const good_count_in_row = 4
const good_row_in_page = 2
const good_count_in_page = good_count_in_row*good_row_in_page

let selectGoods;


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
            get_goods_list();
        }
    });

    }
);

function load_goods_div(begin_count) {
    let exact_count = Math.min(selectGoods.length-begin_count,good_count_in_page);
    if(exact_count<good_count_in_row)
    {
        // only create one row
        let row1_node = $("#row1");
        for(let i=begin_count;i<exact_count;i++){
            let good_card = $(
                '        <div class="col-3">\n' +
                '            <div class="card" style="width: 16rem;">\n' +
                '                <img src="'+selectGoods[i]['picUrl']+'" class="card-img-top" alt="...">\n' +
                '                <div class="card-body">\n' +
                '                    <h5 class="card-title">'+selectGoods[i]['name']+'</h5>\n' +
                '                    <p class="card-text">￥'+selectGoods[i]['price']+'</p>\n' +
                '                    <a id="'+selectGoods[i]['spID']+'" class="btn btn-primary" onclick="showDetail(this)">去购买</a>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>');
            row1_node.append(good_card);
        }
    }else
    {
        // create two row
        let i;
        for (i=begin_count;i<good_count_in_row+begin_count;i++){
            let row1_node = $("#row1");
            let good_card = $(
                '        <div class="col-3">\n' +
                '            <div class="card" style="width: 16rem;">\n' +
                '                <img src="'+selectGoods[i]['picUrl']+'" class="card-img-top" alt="...">\n' +
                '                <div class="card-body">\n' +
                '                    <h5 class="card-title">'+selectGoods[i]['name']+'</h5>\n' +
                '                    <p class="card-text">￥'+selectGoods[i]['price']+'</p>\n' +
                '                    <a id="'+selectGoods[i]['spID']+'" class="btn btn-primary" onclick="showDetail(this)">去购买</a>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>');
                row1_node.append(good_card);
        }

        for(i=good_count_in_row+begin_count;i<begin_count+exact_count;i++) {
            let row1_node = $("#row2");
            let good_card = $(
                '        <div class="col-3">\n' +
                '            <div class="card" style="width: 16rem;">\n' +
                '                <img src="'+selectGoods[i]['picUrl']+'" class="card-img-top" alt="...">\n' +
                '                <div class="card-body">\n' +
                '                    <h5 class="card-title">'+selectGoods[i]['name']+'</h5>\n' +
                '                    <p class="card-text">￥'+selectGoods[i]['price']+'</p>\n' +
                '                    <a id="'+selectGoods[i]['spID']+'" class="btn btn-primary" onclick="showDetail(this)">去购买</a>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>');
                row1_node.append(good_card);
        }
    }
}

function showDetail(item) {
    let id = item.id;
    let storage = window.localStorage;
    storage.setItem("spID", id);
    window.location.href = "commodity.html";
}

function pagination_createSpan(count) {
        return $('<span class=\"page-link\" onclick=\"changeGoods('+count+')\">'+count+'</span>');
}
function assert_pageNum_and_load_pagination() {
        let good_count = selectGoods.length;
        let page_count = Math.ceil(good_count/good_count_in_page);
        let PaginationUL_node = $("#PaginationUL");
        for(let i=1;i<=page_count;i++)
        {
            if(i===1){
                
                let first_li_node = $('<li></li>').attr({
                    class: "page-item active"
                });
                first_li_node.append(pagination_createSpan(i));
                PaginationUL_node.append(first_li_node);
            }else
            {
                let li_node = $('<li></li>').attr({
                    class: "page-item"
                });
                li_node.append(pagination_createSpan(i));
                PaginationUL_node.append(li_node);
            }
        }
}

function changeGoods(page_num) {
      let begin_count = good_count_in_page*(page_num-1);
      $('.page-item').removeClass("active");
      $('.page-item').eq(page_num-1).addClass("active");
      $('#row1').empty();
      $('#row2').empty();
      load_goods_div(begin_count);
}