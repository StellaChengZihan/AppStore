from django.shortcuts import render, redirect
from django.db import connection

# Create your views here.
def index(request):
    """Shows the main page"""

    ## Delete listing
    if request.POST:
        if request.POST['action'] == 'delete':
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM catalog WHERE id = %s", [request.POST['id']])

    ## Use raw query to get all objects
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM catalog ORDER BY id")
        listings = cursor.fetchall()

    result_dict = {'records': listings}

    return render(request,'app/index.html',result_dict)

# Create your views here.
def view(request, id):
    """Shows the main page"""
    
    ## Use raw query to get a listing
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM catalog WHERE id = %s", [id])
        listing = cursor.fetchone()
    result_dict = {'cust': listing}

    return render(request,'app/view.html',result_dict)

# Create your views here.
def add(request):
    """Shows the main page"""
    context = {}
    status = ''

    if request.POST:
        ## Check if id is already in the table
        with connection.cursor() as cursor:

            cursor.execute("SELECT * FROM catalog WHERE id = %s", [request.POST['id']])
            listing = cursor.fetchone()
            ## No account with same id
            if listing == None:
                ##TODO: date validation
                cursor.execute("INSERT INTO catalog VALUES (%s, %s, %s, %s, %s, %s)"
                        , [request.POST['accountid'], request.POST['name'], request.POST['id'], request.POST['neighborhood'], request.POST['room_type'], request.POST['price']])
                return redirect('index')    
            else:
                status = 'Listing with ID %s already exists' % (request.POST['id'])


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
        cursor.execute("SELECT * FROM catalog WHERE id = %s", [id])
        obj = cursor.fetchone()

    status = ''
    # save the data from the form

    if request.POST:
        ##TODO: date validation
        with connection.cursor() as cursor:
            cursor.execute("UPDATE catalog SET accountid = %s, name = %s, id = %s, neighborhood = %s, room_type = %s, price = %s WHERE id = %s"
                    , [request.POST['accountid'], request.POST['name'], request.POST['id'], request.POST['neighborhood'], request.POST['room_type'], request.POST['price'], id ])
            status = 'Listing edited successfully!'
            cursor.execute("SELECT * FROM catalog WHERE id = %s", [id])
            obj = cursor.fetchone()


    context["obj"] = obj
    context["status"] = status
 
    return render(request, "app/edit.html", context)
