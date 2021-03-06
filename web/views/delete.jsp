<%@ page import="java.util.List" %>
<%@ page import="app.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete user</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body class="w3-light-grey">
<div class="w3-container w3-grey w3-opacity w3-left-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/test_war_exploded/list'"> Back to main</button>
</div>
<div class="w3-container w3-padding">
    <%
        List<User> listOfUsers = (List<User>) request.getAttribute("listOfUsers");
        User userForDelete = (User) request.getAttribute("userForRemove");

        String outParameter = "<div class=\"w3-panel w3-green w3-display-container w3-card-4 w3-round\">\n" +
                "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-green" +
                " w3-border w3-border-green w3-hover-border-grey\">×</span>\n" +
                "   <h5>";

        if (listOfUsers == null){
            out.println("<div class=\"w3-panel w3-red w3-display-container w3-card-4 w3-round\">\n"
                    +
                    "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                    "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red" +
                    " w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                    "   <h5>There are no users yet!</h5>\n" +
                    "</div>");
        }

        if (userForDelete != null) {
            if (listOfUsers.size() > 0) {
                for (int i = 0; i < listOfUsers.size(); i++) {
                    if (userForDelete.equals(listOfUsers.get(i))) {
                        out.println(outParameter + "User: '" + userForDelete.getName() + "' has been deleted!</h5>\n" +
                                "</div>");
                    } else {
                        out.println(outParameter + "This user doesn't exist!</h5>\n" + "</div>");
                    }
                }
            }
        } else {
            out.println(outParameter + "Fill in all the fields please!</h5>\n" + "</div>");
        }
    %>
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2> Delete user</h2>
        </div>
        <form method="post" class="w3-selection w3-light-grey w3-padding">
            <label> Name:
                <input type="text" name="name" class="w3-input w3-animate-input w3-border w3-round-large"
                       style="width: 30%"><br/>
            </label>
            <label>Id:
                <input type="text" name="Id" class="w3-input w3-animate-input w3-border w3-round-large"
                       style="width: 30%"><br/>
            </label>
            <label>Password:
                <input type="password" name="pass" class="w3-input w3-animate-input w3-border w3-round-large"
                       style="width: 30%"><br/>
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom"> Submit</button>
        </form>
    </div>
</div>
</body>
</html>
