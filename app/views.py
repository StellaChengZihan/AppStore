from django.shortcuts import render, redirect
from django.db import connection

# Create your views here.
def index(request):
    """Shows the main page"""

    ## Delete account
    if request.POST:
        if request.POST['action'] == 'delete':
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM accounts WHERE accountid = %s", [request.POST['id']])

    ## Use raw query to get all objects
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM accounts ORDER BY accountid")
        accounts = cursor.fetchall()

    result_dict = {'records': accounts}

    return render(request,'app/index.html',result_dict)

# Create your views here.
def view(request, id):
    """Shows the main page"""
    
    ## Use raw query to get an account
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM accounts WHERE accountid = %s", [id])
        account = cursor.fetchone()
    result_dict = {'cust': account}

    return render(request,'app/view.html',result_dict)

# Create your views here.
def add(request):
    """Shows the main page"""
    context = {}
    status = ''

    if request.POST:
        ## Check if accountid is already in the table
        with connection.cursor() as cursor:

            cursor.execute("SELECT * FROM account WHERE accountid = %s", [request.POST['accountid']])
            account = cursor.fetchone()
            ## No account with same id
            if account == None:
                ##TODO: date validation
                cursor.execute("INSERT INTO accounts VALUES (%s, %s, %s)"
                        , [request.POST['name'], request.POST['accountid'], request.POST['ishost']])
                return redirect('index')    
            else:
                status = 'Account with ID %s already exists' % (request.POST['accountid'])


    context['status'] = status
 
    return render(request, "app/add.html", context)

# Create your views here.
def edit(request, id):
    """Shows the main page"""

    # dictionary for initial data with
    # field names as keys
    context ={}

    # fetch the object related to passed id
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM accounts WHERE accountid = %s", [id])
        obj = cursor.fetchone()

    status = ''
    # save the data from the form

    if request.POST:
        ##TODO: date validation
        with connection.cursor() as cursor:
            cursor.execute("UPDATE accounts SET name = %s, accountid = %s, ishost = %s WHERE accountid = %s"
                    , [request.POST['name'], request.POST['accountid'], request.POST['ishost'], id ])
            status = 'Account edited successfully!'
            cursor.execute("SELECT * FROM accounts WHERE accountid = %s", [id])
            obj = cursor.fetchone()


    context["obj"] = obj
    context["status"] = status
 
    return render(request, "app/edit.html", context)
