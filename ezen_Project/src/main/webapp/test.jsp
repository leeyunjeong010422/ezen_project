<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색</title>
    <style>
      .searchBox {
        margin: 20px 0;
      }

      .listBox {
        max-width: 500px;
      }

      .listInner {
        background-color: #dedede;
        margin: 10px 5px;
        padding: 4px;
      }

      .country {
        font-weight: bold;
      }

    </style>
    <script type="text/javascript">
	    function filter() {
	      let search = document.getElementById("search").value.toLowerCase();
	      let listInner = document.getElementsByClassName("listInner");
	
	      for (let i = 0; i < listInner.length; i++) {
	        city = listInner[i].getElementsByClassName("city");
	        country = listInner[i].getElementsByClassName("country");
	        if (city[0].innerHTML.toLowerCase().indexOf(search) != -1 ||
	          country[0].innerHTML.toLowerCase().indexOf(search) != -1
	        ) {
	          listInner[i].style.display = "flex"
	        } else {
	          listInner[i].style.display = "none"
	        }
	      }
	    }

  </script>
  </head>

  <body>
    <div class="searchBox">
      <label>수도: <input type="text" id="search" onkeyup="filter()" placeholder="수도를 검색하세요." /></label>

    </div>
      <div class="listInner">
        <span class="country">Egypt</span>
        <span class="city">Cairo</span>
      </div>
  </body>

</html>