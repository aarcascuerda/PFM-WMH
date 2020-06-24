import xlrd
import SimpleITK as sitk


# Transforms Excel into a list of dictionaries, being each dictionary an Excel row
def convert_excel(path):
    workbook = xlrd.open_workbook(path)
    workbook = xlrd.open_workbook(path, on_demand=True)
    worksheet = workbook.sheet_by_index(0)
    first_row = []
    for col in range(worksheet.ncols):
        first_row.append(worksheet.cell_value(0, col))
    data = []
    for row in range(1, worksheet.nrows):
        elm = {}
        for col in range(worksheet.ncols):
            elm[first_row[col]] = worksheet.cell_value(row, col)
        data.append(elm)
    return data


# Loads the result and test images
def getImages(testFilename, resultFilename, testGauss=True):
    """Return the test and result images, thresholded and non-WMH masked."""
    testImage   = sitk.ReadImage(testFilename)
    resultImage = sitk.ReadImage(resultFilename)
    
    # Check for equality
    assert testImage.GetSize() == resultImage.GetSize()
    
    # Get meta data from the test-image, needed for some sitk methods that check this
    resultImage.CopyInformation(testImage)

    # Define threshold limits based on a binary mask or the gaussian extrapolation.
    minTestWMH = 0.5
    if testGauss:
        minTestWMH *= 1e-2
    maxTestWMH = 1.5

    # Convert to binary masks
    maskedTestImage = sitk.BinaryThreshold(testImage, minTestWMH, maxTestWMH, 1, 0)
    if 'integer' in resultImage.GetPixelIDTypeAsString():
        bResultImage = sitk.BinaryThreshold(resultImage, 1, 1000, 1, 0)
    else:
        bResultImage = sitk.BinaryThreshold(resultImage, 0.5, 1000, 1, 0)
        
    return maskedTestImage, bResultImage


# Get path to subject folder
def get_subject_path(subject_code):
    return f'../results/{subject_code}/'


# Read and convert the Excel data
excel_data = convert_excel('../WMH_reference_standard.xlsx')