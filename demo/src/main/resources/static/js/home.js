function findmore(id) {
    var storage = window.localStorage;
    if (id === "xinan-more") {
        storage.setItem("urlpattern", "/getSpecilatyByCategory");
        storage.setItem("keyword", "/西南");
        window.location.href = "goodList.html";
    }
    if (id === "huanan-more") {
        storage.setItem("urlpattern", "/getSpecilatyByCategory");
        storage.setItem("keyword", "/华南");
        window.location.href = "goodList.html";
    }
    if (id === "huadong-more") {
        storage.setItem("urlpattern", "/getSpecilatyByCategory");
        storage.setItem("keyword", "/华东");
        window.location.href = "goodList.html";
    }
    if (id === "dongbei-more") {
        storage.setItem("urlpattern", "/getSpecilatyByCategory");
        storage.setItem("keyword", "/东北");
        window.location.href = "goodList.html";
    }
    if (id === "zhongyuan-more") {
        storage.setItem("urlpattern", "/getSpecilatyByCategory");
        storage.setItem("keyword", "/中原");
        window.location.href = "goodList.html";
    }
}