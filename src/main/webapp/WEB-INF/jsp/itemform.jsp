<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }

        .form-container {
            width: 300px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        form:input {
            width: calc(100% - 20px);
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Add/Edit Item</h1>
        <form:form method="post" action="saveitem">
            <table>
                <tr>
                    <td>ItemNumber </td>
                    <td><form:input path="itemnumber" /></td>
                </tr>
                <tr>
                    <td>ItemName </td>
                    <td><form:input path="itemname" /></td>
                </tr>
                <tr>
                    <td>Price </td>
                    <td><form:input path="price" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save" /></td>
                </tr>
            </table>
        </form:form>
    </div>
</body>
</html>
