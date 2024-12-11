from torch.utils.data import DataLoader
from torchvision import datasets
from torchvision.transforms import ToTensor

import warnings

        
def load_data():
    warnings.filterwarnings("ignore", category=UserWarning)

    train_data = datasets.MNIST(
        root='data',
        train=True,
        transform=ToTensor(),
        download=True
    )

    test_data = datasets.MNIST(
        root='data',
        train=False,
        transform=ToTensor(),
        download=True
    )
    print("Training data: " + str(train_data.data.shape))    # torch.Size([60000, 28, 28])
    print("Test data: " + str(test_data.data.shape) + "\n")  # torch.Size([10000, 28, 28])
    
    loaders = {
        'train': DataLoader(train_data, batch_size=100, shuffle=True),
        'test': DataLoader(test_data, batch_size=100, shuffle=True)
    }
    return loaders