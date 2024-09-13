<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Items List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }
        a:hover {
            text-decoration: underline;
        }
        #delete-button {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            width: 100%;
            display: none; /* Hidden by default */
        }
        #delete-button:hover {
            background-color: #c82333;
        }
    </style>
    <script>
        // Toggle the display of the delete button based on checkbox selection
        function toggleDeleteButton() {
            var checkboxes = document.querySelectorAll('input[name="selectedItems"]');
            var deleteButton = document.getElementById('delete-button');
            var anyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
            deleteButton.style.display = anyChecked ? 'inline-block' : 'none';
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Items List</h1>
        <!-- Form for deleting selected items -->
        <form method="post" action="deleteItems" id="itemsForm">
            <table>
                <thead>
                    <tr>
                        <th>Select</th>
                        <th>Item Number</th>
                        <th>Item Name</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Iterate over each item and create a checkbox for deletion -->
                    <c:forEach var="item" items="${list}">
                        <tr>
                            <td>
                                <!-- Checkbox for selecting items to delete -->
                                <input type="checkbox" name="selectedItems" value="${item.itemnumber}" onclick="toggleDeleteButton()" />
                            </td>
                            <td>${item.itemnumber}</td>
                            <td>${item.itemname}</td>
                            <td>${item.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- Delete button, which becomes visible when any checkbox is selected -->
            <button type="submit" id="delete-button">Delete Selected</button>
        </form>
        <!-- Link to add a new item -->
        <a href="itemform">Add New Item</a>
    </div>
</body>
</html>
